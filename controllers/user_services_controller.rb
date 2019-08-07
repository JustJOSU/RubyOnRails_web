class UserServicesController < ApplicationController
  before_action :set_user_service, only: [:show, :edit, :update, :destroy]

  # GET /user_services
  # GET /user_services.json
  def index
    @user_services = UserService.all
  end

  # GET /user_services/1
  # GET /user_services/1.json
  def show
    @sell_list = Service.where(user_id: params[:id])
    @user_service = UserService.where(user_id: params[:id])
  end

  # GET /user_services/new
  def new
  end

  # GET /user_services/1/edit
  def edit
  end

  def buy_service
    @act_service = UserService.new
    @act_service.user_id = params[:current_user_id]
    @act_service.service_id = params[:service_id]
    if @act_service.user_id == Service.find_by_id(@act_service.service_id).user_id
      redirect_to service_path(@act_service.service_id), alert: '자신이 판매하는 상품은 구매가 불가합니다'
    else
      @act_service.save
      redirect_to buy_list_path(current_user.id)
    end
  end
  # POST /user_services
  # POST /user_services.json
  def create
    @user_service = UserService.new(user_service_params)

    respond_to do |format|
      if @user_service.save
        format.html { redirect_to @user_service, notice: 'User service was successfully created.' }
        format.json { render :show, status: :created, location: @user_service }
      else
        format.html { render :new }
        format.json { render json: @user_service.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_services/1
  # PATCH/PUT /user_services/1.json
  def update
    respond_to do |format|
      if @user_service.update(user_service_params)
        format.html { redirect_to @user_service, notice: 'User service was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_service }
      else
        format.html { render :edit }
        format.json { render json: @user_service.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_services/1
  # DELETE /user_services/1.json
  def destroy
    @user_service.destroy
    respond_to do |format|
      format.html { redirect_to user_services_url, notice: 'User service was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_service
     # @user_service = UserService.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_service_params
      params.require(:user_service).permit(:user_id, :service_id)
    end
end
