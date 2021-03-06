class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: session_params[:email]) # フォームから送信されたメールアドレスを取得し、一致するユーザーがいるか検索
    if user && user.authenticate(session_params[:password]) # userのパスワードが正しいかどうか確かめている
      log_in user
      redirect_to root_path, success: 'ログインしました'
    else
      flash.now[:danger] = 'ログインできませんでした'
      render :new
     end
  end

      def destroy
        log_out
        redirect_to root_path, info: 'ログアウトしました'
      end

      private
      def session_params
        params.require(:session).permit(:email, :password)
      end

      def log_in(user)
        session[:user_id] = user.id
      end

      def log_out
        session.delete(:user_id) # セッションに保存されているuser_idを削除
        @current_user = nil # ユーザー情報を削除
      end

end
