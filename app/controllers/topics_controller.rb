class TopicsController < ApplicationController
  def new
    @topic = Topic.new
  end

  def create
    @topic = current_user.topics.new(topic_params)

    if @topic.save
      redirect_to topics_path, success: '投稿しました'
    else
      flash.now[:danger] = "投稿できませんでした"
      render :new
    end
  end

  private
  def topic_params
    params.require(:topic).permit(:image, :contents)
  end
end