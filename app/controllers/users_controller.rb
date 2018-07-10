class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update, :setting]
  before_action :correct_user,   only: [:edit, :update]
  before_action :logged_in_user2, only: [:welcome, :home]

  def welcome
  end


  def setting
    @user = User.find(params[:id])
  end

  def show
    @user = User.find_by(params[:id])
    @books = @user.books
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      redirect_back_or welcome_path
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update_profile
    @user = User.find(params[:id])
    @user.update_attributes(user_params)
    redirect_to @user
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "完了しました"
      redirect_to @user
    else
      render 'edit'
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :self_introduction,
                                   :password_confirmation,
                                   :picture)
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    def logged_in_user2
      unless logged_in?
        store_location
        flash[:danger] = "ページにアクセスできません"
        redirect_to root_url
      end
    end

end
