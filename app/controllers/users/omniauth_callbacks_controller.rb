class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def twitter
    callback_from :twitter
  end

  private
  def callback_from(provider)
    provider = provider.to_s

    @user = User.find_for_oauth(request.env['omniauth.auth'])

    if @user
      flash[:notice] = "ログインしました"
      redirect_to("/")
    else
      flash[:notice] = "ログインに失敗しました"
      redirect_to("/")
    end

  end
end