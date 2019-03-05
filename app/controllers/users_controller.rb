class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, success: '登録しました'
    else
      flash.now[:danger] = "登録できませんでした" #うまくいってない
      render :new
    end
  end

  private #class内でのみ実行
  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation) # require POSTで受け取る値のキー  permit 許可するカラム
  end
end
