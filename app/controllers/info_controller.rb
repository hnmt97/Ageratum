class InfoController < ApplicationController
  before_action :authenticate_user, {only: [:update, :edit]}
  before_action :forbid_different_user, {only: [:update, :edit]}
  
  def edit
  	@info = Trading.find_by(nickname: params[:nickname])
    @user = User.find_by(nickname: params[:nickname])
  end
  
  def update
  	@info = Trading.find_by(nickname: params[:nickname])

  	if @info
        @trading.val1 = params[:val1]
        @trading.val2 = params[:val2]
        @trading.val3 = params[:val3]
        @trading.val4 = params[:val4]
  	else
  	  @info = Trading.new(
  	  	nickname: params[:nickname],
        val1: params[:val1],
        val2: params[:val2],
        val3: params[:val3],
        val4: params[:val4]
  	  )
	  end

    @updateProfileScore = Score.new(
      comment: "取引プロフィールを更新しました。 \n取引プロフィール更新ポイント：80アゲラタムスコアを獲得しました。",
      nickname: params[:nickname],
      score: 80
    )

  	if @info.save and @updateProfileScore.save
  	  flash[:notice] = "プロフィールの更新が完了しました。"
  	  $messagenumber = 2
  	  flash[:shareMessage] = "プロフィールを更新しました！\nTwitterでお知らせしますか？"
      redirect_to("/#{@info.nickname}")
    else
      flash[:notice] = "プロフィールの更新に失敗しました。"
      render("info/edit")
  	end
  end
  
end

