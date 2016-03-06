class User < ActiveRecord::Base
  has_many :identities
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
         :omniauthable, omniauth_providers: [:twitter]

  def twitter
    identities.where(provider: 'twitter').first
    end

  def twitter_client
    @twitter_client ||= Twitter.client(access_token: twitter.accesstoken)
  end
  end
