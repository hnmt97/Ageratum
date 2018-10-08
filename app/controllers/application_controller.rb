class ApplicationController < ActionController::Base
  before_action :set_current_user

  $signup = 0

  $messagenumber = 0

  $news = "10月9日より～　β版公開！β版公開を記念して、アゲラタムスコア倍増キャンペーン中。\n※正式版の公開は11月上旬の予定です。"

  def set_current_user
		@current_user = User.find_by(nickname: session[:current_user])
  end

  def authenticate_user
		if @current_user == nil
			flash[:notice] = "ログインが必要です。"
			redirect_to("/")
		end
	end

	def forbid_login_user
		if @current_user
			flash[:notice] = "すでにログインしています。"
			redirect_to("/#{@current_user.nickname}")
		end
	end

	def forbid_current_user
		if @current_user.nickname == params[:nickname]
			flash[:notice] = "権限がありません。"
			redirect_to("/#{@current_user.nickname}")
		end
	end

	def forbid_different_user
		if @current_user.nickname != params[:nickname]
			flash[:notice] = "権限がありません。"
			redirect_to("/#{@current_user.nickname}")
		end
	end

end
