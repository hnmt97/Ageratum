class PostsController < ApplicationController
  before_action :authenticate_user, {only: [:create, :new]}
  before_action :forbid_current_user, {only: [:create, :new]}
  
  def new
  	@post = Post.new
    @user = User.find_by(nickname: params[:nickname])
  end
  
  def create
    @user = User.find_by(nickname: params[:nickname])
  	@post = Post.new(	
  		sender: session[:current_user],
  		receiver: params[:receiver],
      trading: params[:trading],
      method: params[:method],
      contact: params[:contact],
      shipment: params[:shipment],
      packing: params[:packing],
      money: params[:money],
      other: params[:other]
  	)

    @reviewSubmitScore = Score.new(
      comment: "#{@user.name}(@#{@user.nickname})さん宛てにレビューを投稿しました。\nレビュー投稿ポイント：30アゲラタムスコアを獲得しました。",
      nickname: session[:current_user],
      score: 30
    )


    @reviewGetScore = Score.new(
      comment: "#{@current_user.name}(@#{@current_user.nickname})さんからレビューを受け取りました。\nレビュー獲得ポイント：30アゲラタムスコアを獲得しました。",
      nickname: params[:receiver],
      score: 30
    )
    
  	if @post.save and @reviewSubmitScore.save and @reviewGetScore.save
  	  flash[:notice] = "投稿に成功しました。"
  	  $messagenumber = 3
      flash[:shareMessage] = "#{@user.name}(@#{@user.nickname})さん宛てにレビューを投稿しました!\nTwitterでお知らせしますか？"
      redirect_to("/#{@post.receiver}")
    else
      flash[:notice] = "投稿に失敗しました。"
      render("posts/create")
  	end
  end
  
end
