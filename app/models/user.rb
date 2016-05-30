class User < ActiveRecord::Base

  acts_as_follower
  acts_as_followable

  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable, :omniauthable
  include DeviseTokenAuth::Concerns::User

  has_many :stories, dependent: :destroy

end
