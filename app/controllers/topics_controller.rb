class TopicsController < ApplicationController
  include Constants

  def index
    @topics = Topic.all
  end

  def new
    @topic = Topic.new
    @money_list = MONEY_LIST
  end

  def show
    @topic = Topic.find(params[:id])
    @colorbox = @topic.box.tr("[]\"","").split("")  
    # .tr("[] \","ここは何も入れない")...[]で[]を、\"で ""をとる  
    # .split("")...分割した配列を返す。""で、文字の間に「,」がつく
    @money_text = MONEY_LIST.select { |mo| mo[1] == @topic.money }.flatten(1)[0]
              # 配列オブジェクト.select { |変数| ブロック処理 } 
              # .flatten ネストされた配列を1次元配列にフラット化 (1)階層を指定 [0]で[""]と値をとる
  end

  def create
    @topic = current_user.topics.new(topic_params)
    # p topic_params
    topic_params
    if @topic.save
      redirect_to topics_path, success: '投稿しました'
    else
      flash[:info] = "投稿できませんでした"
      redirect_to controller: 'topics', action: 'new'
    end
  end

  def destroy
    @topic = Topic.find(params[:topic_id])
    @topic.destroy
    redirect_to topics_path, info: "投稿を削除しました"
  end

  private
  def topic_params
    params.require(:topic).permit(:image, :contents, :money, box:[])
  end
end
