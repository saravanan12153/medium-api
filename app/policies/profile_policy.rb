class ProfilePolicy
  attr_reader :user, :profile

  def initialize(user, profile)
    @user = user
    @profile = profile
  end

  def update?
    @profile.user_id == @user.id
  end

end