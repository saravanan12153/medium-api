class ResponsePolicy
  attr_reader :user, :response

  def initialize(user, response)
    @user = user
    @response = response
  end

  def update?
    @response.user_id == @user.id
  end

  def destroy?
    @response.user_id == @user.id
  end
end