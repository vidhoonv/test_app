class UsersController < ApplicationController
  before_filter :authenticate, :except => [:show, :new_user, :create]

  before_filter :correct_user, :only => [:edit, :update]
  before_filter :admin_user,   :only => [ :destroy, :toggle_admin ]


 def index
    @title = "All users"
    @users = User.paginate(:page => params[:page])
  end

  def show
     @user=User.find(params[:id])
     @microposts = @user.microposts.paginate(:page => params[:page])
     @title=@user.name
  end

  def new_user

	@user = User.new
	@title = "Sign up"
	
  end

  def create 
	@user = User.new(params[:user])
	if @user.save
		sign_in @user
		flash[:success] = "Welcome to the Sample App!"
		redirect_to @user
	else
		@title ="Sign up"
		render 'new_user'
	end
  end

  def edit
	
	@title="Edit user"
  end


  def update
	
	if @user.update_attributes(params[:user])
		flash[:success]= "Profile updated."
		redirect_to @user
	else
		@title = "Edit user"
		render 'edit'
	end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_path
  end

 def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.following.paginate(:page => params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers.paginate(:page => params[:page])
    render 'show_follow'
  end
#added extra

  def toggle_admin
	@user=User.find(params[:id])
	@user.toggle!(:admin)  
	flash[:success]= "Privilege changed."
	redirect_to users_path
 end

#end of extra

  private



  def correct_user
	@user = User.find(params[:id])
	redirect_to(root_path) unless current_user?(@user)
  end
  def admin_user
      redirect_to(root_path) unless current_user.admin?
   end

end
