class UsersController < ApplicationController
  before_action :authenticate_user, {only: [:show, :log, :inbox, :outbox, :logout, :userSearch]}


  def set_user_total
    @total = 0
    @user.scores.each do |score|
      @total += score.score
    end
  end

  def show
  	@user = User.find_by(nickname: params[:nickname])
    @info = @user.info
    @tra = @user.tra
    @act = @user.act
    @mon = @user.mon
    @mea = @user.mea
    @shi = @user.shi
    @pac = @user.pac
    @con = @user.con

    set_user_total
  end

  def log
    @user = User.find_by(nickname: params[:nickname])
    @histories = @user.scores.order(created_at: :desc)

    set_user_total
  end

  def inbox
  	@user = User.find_by(nickname: params[:nickname])
    @posts = @user.receives.order(created_at: :desc)

    set_user_total
  end

  def outbox
  	@user = User.find_by(nickname: params[:nickname])
    @posts = @user.sends.order(created_at: :desc)

    set_user_total
  end

  def logout
    session[:current_user] = nil
    flash[:notice] = "ログアウトしました。"
    redirect_to("/")
  end

  def userSearch
    @user = User.find_by(nickname: params[:nickname])
    if @user
      redirect_to("/#{@user.nickname}")
    else
      flash[:notice] = "お探しのユーザーは見つかりませんでした。"
      redirect_to("/#{@current_user.nickname}")
    end

  end

end
