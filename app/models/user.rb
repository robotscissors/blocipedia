class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
<<<<<<< HEAD
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable

=======
         :recoverable, :rememberable, :trackable, :validatable
>>>>>>> f58d62cfdf67a33ee964ecb00b9d0f1496eebbff
  has_many :wikis
end
