class ApiController < ApplicationController
  skip_before_action :verify_authenticity_token

  def authenticated?
    authenticate_or_request_with_http_basic do |name, password|
      user = User.find_by(name: name, password: password)
      if user
        @current_user = user
        true
      else
        false
      end
    end
  end

  def current_user # rubocop:disable Style/TrivialAccessors
    @current_user
  end
end
