class UsersController < ApplicationController

  def show
     @user=User.find(params[:id])
     @title=@user.name
  end

  def new_user

	@user = User.new
	@title = "Sign up"
	
  end

  def create 
	@user = User.new(params[:user])
	if @user.save
		flash[:success] = "Welcome to the Sample App!"
		redirect_to @user
	else
		@title ="Sign up"
		render 'new_user'
	end
  end

end
