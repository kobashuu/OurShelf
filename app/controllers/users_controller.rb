class UsersController < ApplicationController

  def show
    @user = User.find_by(params[:account_name])
  end

  def new
  end
end
