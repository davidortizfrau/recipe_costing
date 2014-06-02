class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation	
  has_secure_password

  before_save { |user| user.email = user.email.downcase }
  before_save :create_remember_token

  validates :name, presence: true, length: { maximum: 50 }
	
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true,
						format: { with: VALID_EMAIL_REGEX },
						uniqueness: { case_sensitive: false }
	
	validates :password, length: { minimum: 4 }, on: :create
  validates :password_confirmation,  presence: true, on: :create

	# Relationships
	has_many :ingredients, :dependent => :destroy
	has_many :ingredient_categories, :dependent => :destroy
	
	has_many :recipes, :dependent => :destroy
	has_many :recipe_categories, :dependent => :destroy

	has_many :plates, :dependent => :destroy
	has_many :plate_categories, :dependent => :destroy

private

	def create_remember_token
		self.remember_token = SecureRandom.urlsafe_base64
	end
end
