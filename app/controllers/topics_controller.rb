class TopicsController < ApplicationController
  @@money_list = [["5,000円以下", "1"],["5,000円~10,000円", "2"],["10,000円~15,000円", "3"],["15,000円~20,000円", "4"],["20,000円以上","5"]]

  def index
    @topics = Topic.all
  end

  def new
    @topic = Topic.new
    @money_list = @@money_list
  end

  def show
    @topic = Topic.find(params[:id])
    # @unbox = @topic.box.tr("[]\" ","").split(",")
    @unbox = eval(@topic.box)
    @money_text = @@money_list.select { |op| op[1] == @topic.money }.flatten(1)[0]
  end


  def create
    @topic = current_user.topics.new(topic_params)
    p topic_params
    if @topic.save!
      redirect_to topics_path, success: '投稿しました'
    else
      logger.debug(@item.errors.full_messages)
      flash.now[:danger] = "投稿できませんでした"
      render :new
    end
  end

  def destroy
    @topic = Topic.find(params[:topic_id])
    @topic.destroy
    redirect_to topics_path, notice: "投稿を削除しました"
  end

  private
  def topic_params
    params.require(:topic).permit(:image, :contents, :money, box:[])
  end
end
