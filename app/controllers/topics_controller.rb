class TopicsController < ApplicationController
  before_action :color_string, only: [:create, :update]  # createとupdateの前に必ず実行
  def index
    @topics = Topic.all
  end

  def new
    @topic = Topic.new
  end

  def show
    @topic = Topic.find(params[:id])
  end

  # def topic
  #   # params:[gamelist]で配列の値を取得可能。
  #   # 二次元配列の場合、受取先の変数を2つ宣言する。下記例では、
  #   # di1がタイトル、di2がチェックボックスの状態(0 or 1)が格納される。
  #   params[:color].each do | di1,di2 |
  #
  #     # チェックボックスにチェックがついている場合
  #     if di2 == "1"
  #       # DBのtitleカラムにタイトルを格納し保存
  #       @topic = Topic.new(box:di1)
  #       @topic.save
  #     end
  #   end
  #   redirect_to("topic_path(topic.id)")
  # end

  # 配列を文字列にする（/区切り）
      def color_string
        params[:order][:color] = params[:order][:color].join("/")  # to string
      end
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
    params.require(:topic).permit(:image, :contents, box:[])
  end
end
