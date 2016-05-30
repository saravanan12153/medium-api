class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    # flash[:alert] = "You are not authorized to perform this action."
    #redirect_to(request.referrer || stories_path)
    render nothing: true, status: :unauthorized
  end
end
