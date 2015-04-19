class UsersController < ApplicationController
   # http_basic_authenticate_with name: 'admin', password: 'password'  
   # before_filter :restrict_access
   before_action :doorkeeper_authorize!
   
   def index
     @users = User.all 
   end
    
    def show
      @user = User.find(params[:id])
    end
    
    def create
      @user = User.new(user_params) 
      @user.save
      redirect_to @user
    end


  private
    def user_params
      params.require(:user).permit(:first_name, :last_name)
    end
    
    def restrict_access
      authenticate_or_request_with_http_token do |token, options|
        ApiKey.exists?(access_token: token)
      end 
    end 
end
