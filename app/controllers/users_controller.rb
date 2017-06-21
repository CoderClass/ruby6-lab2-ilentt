class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def index
    @users = User.all.shuffle
  end

  def create
  	@user = User.new(user_params)
  	 if @user = User.save
  	 	flash[:success] = "Got it bro!"
  	 	session[:user_id] = @user.id
  	 	redirect_to root_path
  	 else
  	 	flash[:error] = "Error: #{@user.errors.full_messages.to_sentence}"
  	 	render 'new'
  end
end

private

def user_params 
	params.require(:user).permit(:name, :email, :password, :image_url)
end

end
