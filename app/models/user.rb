class User < ActiveRecord::Base

  acts_as_follower
  acts_as_followable

  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable, :omniauthable
  include DeviseTokenAuth::Concerns::User

  has_many :stories, dependent: :destroy
  has_many :responses, dependent: :destroy
  has_one :profile, dependent: :destroy

  after_create :create_profile

  private

  def create_profile
    Profile.create!(user_id: self.id)
  end

end
