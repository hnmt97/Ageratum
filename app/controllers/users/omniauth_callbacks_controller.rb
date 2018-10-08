class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  before_action :forbid_login_user, {only: [:callback_from, :twitter]}

  def twitter
    callback_from :twitter
  end

  private
  def callback_from(provider)
    provider = provider.to_s

    @signed_user = User.find_for_oauth(request.env['omniauth.auth'])
    @user = User.get_user_nickname(request.env['omniauth.auth'])

    if @signed_user
      session[:current_user] = @user.nickname
      flash[:notice] = "ログインしました。"
      if $signup == 1
        $messagenumber = 1
        flash[:shareMessage] = "アゲラタムに登録しました！\nTwitterでお知らせしますか？"
      end

      $signup += 1

      redirect_to("/#{@user.nickname}")
    else
      flash[:notice] = "ログインに失敗しました。"
      redirect_to("/")
    end

  end
end