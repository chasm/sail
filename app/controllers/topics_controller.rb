class TopicsController < ApplicationController
  before_action :is_authenticated?
  before_action :get_topic, only: [ :edit, :update, :destroy ]

  def index
    @topics = Topic.all.entries
    puts "topics", @topics
  end

  def show
    redirect_to topics_url, error: "Topic not found." unless @topic = Topic.find_by(slug: params[:slug])
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(topic_params)
    @topic.user = current_user

    if @topic.save
      redirect_to topics_url, notice: "Topic created."
    else
      flash.now[:error] = "Failed to create topic: #{@topic.errors}."
      render :new
    end
  end

  def edit
    redirect_to topic_url(@topic),
      error: "Only the owner of a topic may edit it." unless @topic.user == current_user
  end

  def update
    redirect_to topic_url(@topic),
      error: "Only the owner of a topic may edit it." unless @topic.user == current_user

    if @topic.update(topic_params)
      redirect_to topic_url(@topic), notice: "Topic updated."
    else
      flash.now[:error] = "Failed to update topic: #{@topic.errors}."
      render :edit
    end
  end

  def destroy
    title = @topic.title
    if @topic.destroy
      redirect_to :index, notice: "Deleted topic &ldquo;#{title}.&rdquo; and associated notes."
    else
      redirect_to :index, error: "Failed to delete topic: #{@topic.errors}."
    end
  end

  private

  def get_topic
    redirect_to topics_url unless @topic = Topic.find_by(id: params[:id])
  end

  def topic_params
    params.require(:topic).permit(:title)
  end
end