class TopicsController < ApplicationController
  # before_action :box_string, only: [:create]  # createの前に必ず実行
  def index
    @topics = Topic.all
  end

  def new
    @topic = Topic.new
  end

  def show
    @topic = Topic.find(params[:id])
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

    # 配列を文字列にする（/区切り）
  # def box_string
  #   params[:topic][:box] = params[:topic][:box].join("/")
  # end

  def destroy
    @topic = Topic.find(params[:topic_id])
    @topic.destroy
    redirect_to topics_path, notice: "投稿を削除しました"
  end

  private
  def topic_params
    params.require(:topic).permit(:image, :contents, box:[])
  end
end
