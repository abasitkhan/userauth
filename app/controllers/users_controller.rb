class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    #@user = User.new(params.require(:user))
    #@user = User.new(params.require(:user).permit(:name,:email,:password, 
   #                              :password_confirmation))

    @user = User.new(user_params)
    if @user.save
      flash[:success] = "User successfully saved...!"
      redirect_to @user
    else
      render 'new'
    end
  end

private
  def user_params
    params.require(:user).permit(:name,:email,:password, 
                                 :password_confirmation)
  end
end
