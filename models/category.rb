class Category < ApplicationRecord
	has_many :services

	def cs_list
 		return Service.where(category_id: self.id).all.limit(3)
 	end
end
