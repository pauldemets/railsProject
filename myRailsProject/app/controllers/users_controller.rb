class UsersController < ApplicationController
    before_action :authenticate_user!
    def index
        @users = User.all
    end
    def show
        @user = User.find(params[:id])
        @posts = @user.posts.all
    end
    def new 
        @user = User.new
    end
    def create
        user_params = params.require(:user).permit(:first_name,:last_name,:email,:birth_date)
        @user = User.new(user_params)
        if @user.save
            redirect_to @user
        else
            render "new"
        end
    end
    def edit
        @user = User.find(params[:id])
    end
    def update
        @user = User.find(params[:id])
        user_params = params.require(:user).permit(:first_name,:last_name,:email,:birth_date)
        @user.update_attributes(user_params)
        redirect_to @user
    end
    def destroy
        @user = User.find(params[:id])
        @user.destroy
        session[:user_id] = nil
        redirect_to users_path
    end
end
