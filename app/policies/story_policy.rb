class StoryPolicy
  attr_reader :user, :story

  def initialize(user, story)
    @user = user
    @story = story
  end

  def update?
    @story.user_id == @user.id
  end

  def destroy?
    @story.user_id == @user.id
  end
end