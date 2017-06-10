class Wiki < ActiveRecord::Base
  belongs_to :user
  has_many :collaborators
  has_many :wiki_collaborators, through: :collaborators, :source => :user

  validates :title, length: {minimum: 5}, presence: true
  validates :body, length: {minimum: 20}, presence: true
  validates :private, default: false
  validates :user, presence: true
end
