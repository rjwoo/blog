class Post < ActiveRecord::Base

  belongs_to :user

  validates :title, presence: true,
                    uniqueness: true

  validates :body, presence: true

  belongs_to :category

  has_many :comments, dependent: :destroy

  def new_first_comments
    comments.order(created_at: :desc)
  end

end
