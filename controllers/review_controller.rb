class ReviewController < ApplicationController
	 before_action :set_service, only: [:edit, :update, :destroy]

	def new
		@review = Review.new
	end

	def create
		@service = Review.new
		@service.user_id = params[:current_user_id]
		@service.service_id = params[:service_id]
		@service.text = params[:text]
		@service.save
	end

	def edit

	end
	private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:user_id, :service_id, :text)
    end
end
