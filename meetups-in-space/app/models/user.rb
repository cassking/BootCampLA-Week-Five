class User < ActiveRecord::Base
  has_many :memberships
  has_many :comments
  has_many :meetups, through: :memberships

 #validations need to go jhere
 validates :provider, presence: true
 validates :username, :uid, :email, uniqueness: true, presence: true
 validates :username, length: { in: 2..20 }
 validates_format_of :email, :with => /@/

  def self.find_or_create_from_omniauth(auth)
    provider = auth.provider
    uid = auth.uid

    find_or_create_by(provider: provider, uid: uid) do |user|
      user.provider = provider
      user.uid = uid
      user.email = auth.info.email
      user.username = auth.info.name
      user.avatar_url = auth.info.image
    end
  end
end
