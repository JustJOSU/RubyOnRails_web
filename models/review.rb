class Review < ApplicationRecord
	belongs_to :user, required: false
	belongs_to :service, required: false
end
