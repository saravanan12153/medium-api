class ResponsesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_story
  before_action :set_response, only: [:show, :update, :destroy]

  def index
    @responses = @story.responses.all

    render json: @responses
  end

  def show
    render json: @response
  end

  def create
    @response = @story.responses.build(response_params)
    @response.user_id = current_user.id

    if @response.save
      render json: @story, status: :created, location: @story
    else
      render json: @response.errors, status: :unprocessable_entity
    end
  end

  def update
    authorize @response
    if @response.update(response_params)
      head :no_content
    else
      render json: @response.errors, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @response
    @response.destroy

    head :no_content
  end

  private

  def set_story
    @story = Story.find(params[:story_id])
  end

  def set_response
    @response = @story.responses.find(params[:id])
  end

  def response_params
    params.require(:response).permit(:content)
  end
end
