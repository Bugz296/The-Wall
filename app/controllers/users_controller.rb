class UsersController < ApplicationController
  def new
    
  end
  def create
    user = User.new(params.require(:user).permit(:username))
    if user.save
        flash[:notice] = ["Welcome, #{params[:user]['username']}"]
        redirect_to messages_path
    else
        flash[:notice] = user.errors.full_messages
        redirect_to new_user_path
    end
  end
  def logout
    redirect_to new_user_path
  end
end
