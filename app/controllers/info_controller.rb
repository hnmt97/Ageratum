class InfoController < ApplicationController
  before_action :authenticate_user, {only: [:update, :edit]}
  before_action :forbid_different_user, {only: [:update, :edit]}
  
  def edit
  	@info = Info.find_by(nickname: params[:nickname])
    @user = User.find_by(nickname: params[:nickname])
  end
  
  def update
  	@info = Info.find_by(nickname: params[:nickname])

  	if @info
        @info.genre = params[:genre]
        @info.activation = params[:activation]
        @info.trading = params[:trading]
        @info.method = params[:method]
        @info.contact = params[:contact]
        @info.shipment = params[:shipment]
        @info.packing = params[:packing]
        @info.money = params[:money]
        @info.history = params[:history]
        @info.other = params[:other]
  	else
  	  @info = Info.new(
  	  	nickname: params[:nickname],
        genre: params[:genre],
        activation: params[:activation],
        trading: params[:trading],
        method: params[:method],
        contact: params[:contact],
        shipment: params[:shipment],
        packing: params[:packing],
        money: params[:money],
        history: params[:history],
        other: params[:other]
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

