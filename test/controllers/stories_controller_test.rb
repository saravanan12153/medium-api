require 'test_helper'

class StoriesControllerTest < ActionController::TestCase
  setup do
    @story = stories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:stories)
  end

  test "should create story" do
    assert_difference('Story.count') do
      post :create, story: { content: @story.content, title: @story.title }
    end

    assert_response 201
  end

  test "should show story" do
    get :show, id: @story
    assert_response :success
  end

  test "should update story" do
    put :update, id: @story, story: { content: @story.content, title: @story.title }
    assert_response 204
  end

  test "should destroy story" do
    assert_difference('Story.count', -1) do
      delete :destroy, id: @story
    end

    assert_response 204
  end
end
