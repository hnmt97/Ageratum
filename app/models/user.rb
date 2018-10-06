class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :rememberable, :trackable, :omniauthable, omniauth_providers: %i(twitter)

  def self.find_for_oauth(auth)
   @user = User.find_by(uid: auth.uid, provider: auth.provider)

   unless @user
     @user = User.new(
       uid:      auth.uid,
       provider: auth.provider,
       image: auth.info.image,
       name: auth.info.name,
       nickname: auth.info.nickname
       )
   end

   @user.save
  end

end
