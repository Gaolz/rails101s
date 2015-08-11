class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:github]

  has_many :groups
  has_many :posts

  has_many :group_users
  has_many :participated_groups, through: :group_users, source: :group

  def is_member_of?(group)
  	participated_groups.include?(group)
  end

  def join!(group)
  	participated_groups << group
  end

  def quit!(group)
  	participated_groups.delete(group)
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.name = auth.info.nickname
      user.password = Devise.friendly_token[0,20]
    end
  end
end
