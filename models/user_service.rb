class UserService < ApplicationRecord
  belongs_to :user, required: false
  belongs_to :service, required: false

  def returnService
  	return Service.find_by_id(self.service_id)
  end

  def Service_name
  	return Service.find_by_id(self.service_id).service_name
  end

  def Service_price
  	return Service.find_by_id(self.service_id).price
  end

  def seller_name
    service = Service.find_by_id(self.service_id)
    seller_email = User.find_by_id(service.user_id).email
    return seller_email
  end
end
