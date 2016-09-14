class Api::ItemsController < ApiController
  before_action :authenticated?
  before_action :find_list

  def create
    item = @list.items.build(item_params)
    if item.save
      render json: item
    else
      render json: { errors: item.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def update
    item = Item.find(params[:id])
    raise unless item.list.user == current_user
    if item.update(item_params)
      render json: item
    else
      render json: { errors: item.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def destroy
    begin # rubocop:disable Style/RedundantBegin
      item = Item.find(params[:id])
      raise unless item.list.user == current_user
      item.destroy
      render json: {}, status: :no_content
    rescue ActiveRecord::RecordNotFound
      render json: {}, status: :not_found
    end
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :status)
  end

  def find_list
    @list = current_user.lists.find(params[:list_id])
  end
end
