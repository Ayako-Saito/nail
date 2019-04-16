class TopicsController < ApplicationController
  @@money_list = [["5,000円以下", "1"],["5,000円~10,000円", "2"],["10,000円~15,000円", "3"],["15,000円~20,000円", "4"],["20,000円以上","5"]]
              # [["表示する文字","データベースに登録する値"]]

  def index
    @topics = Topic.all
  end

  def new
    @topic = Topic.new
    @money_list = @@money_list
  end

  def show
    @topic = Topic.find(params[:id])
    @colorbox = @topic.box.tr("[]\"","").split("")  
    # .tr("[] \","ここは何も入れない")...[]で[]を、\"で ""をとる  
    # .split("")...分割した配列を返す。""で、文字の間に「,」がつく
    @money_text = @@money_list.select { |mo| mo[1] == @topic.money }.flatten(1)[0]
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
      flash.now[:info] = "投稿できませんでした"
      render :new
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
