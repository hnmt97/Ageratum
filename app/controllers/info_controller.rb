class InfoController < ApplicationController
  before_action :authenticate_user, {only: [:update, :edit]}
  before_action :forbid_different_user, {only: [:update, :edit]}
  
  def edit
    @user = User.find_by(nickname: params[:nickname])
  	@tra = Trading.find_by(nickname: params[:nickname])
    @act = Activation.find_by(nickname: params[:nickname])
    @mea = Mean.find_by(nickname: params[:nickname])
    @mon = Money.find_by(nickname: params[:nickname])
    @con = Contact.find_by(nickname: params[:nickname])
    @shi = Shipment.find_by(nickname: params[:nickname])
    @pac = Packing.find_by(nickname: params[:nickname])
    @info = Info.find_by(nickname: params[:nickname])
  end
  
  def update
    @user = User.find_by(nickname: params[:nickname])
  	@tra = Trading.find_by(nickname: params[:nickname])
    @act = Activation.find_by(nickname: params[:nickname])
    @mea = Mean.find_by(nickname: params[:nickname])
    @mon = Money.find_by(nickname: params[:nickname])
    @con = Contact.find_by(nickname: params[:nickname])
    @shi = Shipment.find_by(nickname: params[:nickname])
    @pac = Packing.find_by(nickname: params[:nickname])
    @info = Info.find_by(nickname: params[:nickname])
    

  	if @tra
        @tra.val1 = params[:tval1]
        @tra.val2 = params[:tval2]
        @tra.val3 = params[:tval3]
        @tra.val4 = params[:tval4]
  	else
  	  @tra = Trading.new(
  	  	nickname: params[:nickname],
        val1: params[:tval1],
        val2: params[:tval2],
        val3: params[:tval3],
        val4: params[:tval4]
  	  )
	  end

    @tra.save



    if @act
        @act.val1 = params[:aval1]
        @act.val2 = params[:aval2]
        @act.val3 = params[:aval3]
        @act.val4 = params[:aval4]
        @act.val5 = params[:aval5]
    else
      @act = Activation.new(
        nickname: params[:nickname],
        val1: params[:aval1],
        val2: params[:aval2],
        val3: params[:aval3],
        val4: params[:aval4],
        val5: params[:aval5]
      )
    end

    @act.save



    if @mea
        @mea.val1 = params[:mval1]
        @mea.val2 = params[:mval2]
        @mea.val3 = params[:mval3]
    else
      @mea = Mean.new(
        nickname: params[:nickname],
        val1: params[:mval1],
        val2: params[:mval2],
        val3: params[:mval3]
      )
    end

    @mea.save



    if @con
        @con.val1 = params[:cval1]
        @con.val2 = params[:cval2]
        @con.val3 = params[:cval3]
        @con.val4 = params[:cval4]
    else
      @con = Contact.new(
        nickname: params[:nickname],
        val1: params[:cval1],
        val2: params[:cval2],
        val3: params[:cval3],
        val4: params[:cval4]
      )
    end

    @con.save




    if @shi
        @shi.val1 = params[:sval1]
        @shi.val2 = params[:sval2]
        @shi.val3 = params[:sval3]
        @shi.val4 = params[:sval4]
        @shi.val5 = params[:sval5]
        @shi.val6 = params[:sval6]
    else
      @shi = Shipment.new(
        nickname: params[:nickname],
        val1: params[:sval1],
        val2: params[:sval2],
        val3: params[:sval3],
        val4: params[:sval4],
        val5: params[:sval5],
        val6: params[:sval6]
      )
    end

    @shi.save



    if @pac
        @pac.val1 = params[:pval1]
        @pac.val2 = params[:pval2]
        @pac.val3 = params[:pval3]
        @pac.val4 = params[:pval4]
        @pac.val5 = params[:pval5]
        @pac.val6 = params[:pval6]
    else
      @pac = Packing.new(
        nickname: params[:nickname],
        val1: params[:val1],
        val2: params[:val2],
        val3: params[:val3],
        val4: params[:val4],
        val5: params[:pval5],
        val6: params[:pval6]
      )
    end

    @pac.save



    if @mon
        @mon.val1 = params[:moval1]
        @mon.val2 = params[:moval2]
        @mon.val3 = params[:moval3]
        @mon.val4 = params[:moval4]
        @mon.val1 = params[:moval5]
        @mon.val2 = params[:moval6]
        @mon.val3 = params[:moval7]
        @mon.val4 = params[:moval8]
    else
      @mon = Money.new(
        nickname: params[:nickname],
        val1: params[:moval1],
        val2: params[:moval2],
        val3: params[:moval3],
        val4: params[:moval4],
        val1: params[:moval5],
        val2: params[:moval6],
        val3: params[:moval7],
        val4: params[:moval8]
      )
    end

    @mon.save



    if @info
        @info.genre = params[:genre]
        @info.history = params[:history]
        @info.other = params[:other]
    else
      @info = Info.new(
        nickname: params[:nickname],
        genre: params[:genre],
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

