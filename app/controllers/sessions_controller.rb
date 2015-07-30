class SessionsController < ApplicationController
  def create
    @user = User.where(email: user_params[:email]).first
    if @user && @user.authenticate(user_params[:password])
      session[:user_id] = @user.id
      redirect_to posts_index_path, notice: "logged in!"
    else
      flash.now.alert = "invalid login credentials"
      render 'new'  # prior was redirect_to new_session_path
    end #end for if
  end #end for create

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "logged out"
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end
end
