class UsersController < ApplicationController

  def show
     @user=User.find(params[:id])
  end

  def new_user
	@title = "Sign up"
  end

end
