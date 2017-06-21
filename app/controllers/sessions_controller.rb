class SessionsController < ApplicationController
  def new
  end

  def create
  	 if @user = User.find_by(email: params[:email])
  	 	if @user.authenticate(params[:password])
  	 		redirect_to users_path
  	 	else
  	 		flash.now[:error] = "Dude, wrong password"
  	 		render 'new'
  	 	end
  	 else
  	 	flash.now[:error] = "something else is wrong"
  	 	render 'new'
  	 end
  end

  def destroy
  	@user = User.find_by(params[:email])
    if @user_id != current_user
      return render text: 'Not Allowed', status: :forbidden
    end

    @user.destroy
    redirect_to root_path
  end
end
