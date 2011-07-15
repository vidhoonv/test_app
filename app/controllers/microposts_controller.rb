class MicropostsController < ApplicationController
  before_filter :authenticate, :only => [:create, :destroy]
  before_filter :authorized_user, :only => :destroy

  def create
   if params[:micropost][:content].length > 140
        flash[:error] = "Talk less act more!"
    	  redirect_to root_path
   else
     @text = params[:micropost][:content]
     @length=@text.length
     @length=@length-7
     params[:micropost][:content] = @text[3..@length]
     puts params[:micropost][:content]
     @micropost = current_user.microposts.build(params[:micropost])
     if @micropost.save
    	  flash[:success] = "Micropost created!"
    	  redirect_to root_path
      else
        @feed_items = []
    	  render 'pages/home'
   	end
   end
  end

  def destroy
    @micropost.destroy
    flash[:success] = "Your post has been deleted!"
    redirect_back_or root_path
  end

  def new
  
    @micropost = Micropost.new(:parent_id => params[:parent_id])
    @parent_post_id = params[:parent_id]
    @parent_post = Micropost.find_by_id(@parent_post_id)
  end

  private
	def authorized_user

	     @micropost = current_user.microposts.find(params[:id])
	rescue
	      redirect_to root_path 
	end
end

