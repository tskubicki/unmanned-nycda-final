class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  validates :username, uniqueness: true, presence: true
  after_create :create_roles_table_entry

  has_many :friendships
  has_many :friends, :through => :friendships
  has_one :role
  has_many :games
  has_many :messages

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	has_attached_file :avatar, :styles =>
		{:medium => "300x300>",	:thumb => "100x100>"},
		:default_url => "missing.png"

	validates_attachment_content_type :avatar,
		:content_type => /\Aimage\/.*\Z/

    #kinda dirty, but it works for now
    def self.get_username_of(input_id)
      User.find(input_id).username
    end

  private
  def create_roles_table_entry
    Role.create(user_id: self.id, is_user: true, is_admin: false)
  end
  
end
