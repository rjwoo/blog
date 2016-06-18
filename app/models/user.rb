class User < ActiveRecord::Base

  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true, format:/\A([\w+\-]\.?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :password, presence: true, :on => :create
  validates :password_confirmation, presence: true, :on => :update, :unless => lambda{ |user| user.password.blank? }

  has_many :posts, dependent: :nullify
  has_many :comments, dependent: :nullify

  def full_name
    "#{first_name} #{last_name}"
  end


end
