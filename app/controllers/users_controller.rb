class UsersController < ApplicationController
  def index
    @user = User.all
  end
  def new
      @user = User.new
  end
  def create
    @user = User.new user_params
    if @user.save
      redirect_to "/"
    else
      render "new"
    end #end for if
  end #end for create

  def edit
    @user = User.find(params[:id])
  end
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params.require(:user).permit(:name, :email, :password, :password_confirmation))
      redirect_to users_path
    else
      render "edit"
    end #end for if
  end #end for update

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    reset_session
    redirect_to users_path
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end #end for private

  end #end for User
