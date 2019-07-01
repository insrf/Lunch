class User < ApplicationRecord
  has_many :orders
  has_many :items, :through => :orders

  after_initialize :set_admin_role, :if => :new_record?

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

   validates :name, presence: true
   validates_format_of :email, with: /\A[^@\s]+@[^@\s]+\z/

   def set_admin_role
     self.admin = true if User.count == 0
   end
end
