class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  validates :username, uniqueness: true, presence: true

  has_many :friendships
  has_many :friends, :through => :friendships
  has_one :role
  has_many :games
  has_many :messages

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	has_attached_file :avatar, :styles =>
		{:medium => "300x300>",	:thumb => "100x100>"},
		:default_url => "/images/missing.png"

	validates_attachment_content_type :avatar,
		:content_type => /\Aimage\/.*\Z/
end
