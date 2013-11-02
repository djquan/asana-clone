class UsersController < ApplicationController
  def new
    @user = User.new
    render :new
  end

  def show
    render json: current_user
  end

  def index
    current = User.includes(:projects).find(current_user.id)
    render json: current, include: :projects
  end
  
  def create
    @user = User.new(user_params)

    if @user.save
      login_user!(@user)
      redirect_to app_url
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
