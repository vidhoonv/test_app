class UsersController < ApplicationController

  def show
     @user=User.find(params[:id])
     @title=@user.name
  end

  def new_user
	@title = "Sign up"
  end

end
