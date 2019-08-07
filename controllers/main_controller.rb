class MainController < ApplicationController
	def index
		@category = Category.all
		@service = Service.all
	end
end
