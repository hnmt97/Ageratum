class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :rememberable, :trackable, :omniauthable, omniauth_providers: %i(twitter)

  def self.find_for_oauth(auth)
   @signed_user = User.find_by(uid: auth.uid, provider: auth.provider)

   unless @signed_user
     @signed_user = User.new(
       uid:      auth.uid,
       provider: auth.provider,
       image: auth.info.image,
       name: auth.info.name,
       nickname: auth.info.nickname
       )

     @signed_score = Score.new(
        nickname: auth.info.nickname,
        score: 300,
        comment: "アゲラタムに登録しました。"
      )
     
     if @signed_score.save and @signed_user.save
      $signup = 1
     end
      
   end

   if @signed_user.nickname != auth.info.nickname
    @error_message = "一致するユーザーIDが見つかりません。\nもしtwitterのユーザーIDを更新していましたら、ページ下にありますお問い合わせフォームよりIDの更新手続きを行ってください。"
    redirect_to("/")
  end

   return @signed_user
  end

  def self.get_user_nickname(auth)
    return User.find_by(nickname: auth.info.nickname)
  end

  def scores
    return Score.where(nickname: self.nickname)
  end

  def receives
    return Post.where(receiver: self.nickname)
  end

  def sends
    return Post.where(sender: self.nickname)
  end

  def info
    return Info.find_by(nickname: self.nickname)
  end


end
