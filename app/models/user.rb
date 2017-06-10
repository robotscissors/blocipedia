class User < ActiveRecord::Base

  enum role: [:standard, :premium, :admin]
  after_initialize(:set_default_role, { if: :new_record? })


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable

  has_many :wikis
  has_many :collaborators, dependent: :destroy


  private
  def set_default_role
    self.role ||= :standard
  end

end
