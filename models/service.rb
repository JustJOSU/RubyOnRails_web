class Service < ApplicationRecord
	has_many :user_services, dependent: :destroy
	has_many :users, through: :user_services
	has_many :reviews, dependent: :destroy
	belongs_to :category
	
	def Sell_count
  		return UserService.where(service_id: self.id).size
 	end

 	def returnEmail
 		return User.find_by_id(self.user_id).email
 	end
end
