class User < ApplicationRecord
     has_secure_password

     validates :username, presence: true, uniqueness: true
     validates :password, presence: true

     has_many :surveys
     has_many :participants
end
