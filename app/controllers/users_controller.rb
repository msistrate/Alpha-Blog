class UsersController < ApplicationController 
	def new 
		@user = User.new
	end

	def edit
		@user = User.find(params[:id]) 
	end

	def show
		@user = User.find(params[:id])
		@articles = @user.articles.paginate(page: params[:page], per_page: 5)
	end

	def index
		@users = User.paginate(page: params[:page], per_page: 5)
	end
	
	def update
		@user = User.find(params[:id])
		
		if @user.update(user_params)
			flash[:notice] = "User #{@user.username} successfully edited!"
			redirect_to @user 
		else
			render 'new'
		end	
	end	
	
	def create
		@user = User.new(user_params)
		if @user.save 
			flash[:notice] = "Welcome to Alpha Blog #{@user.username}"
			redirect_to articles_path
		else
			render 'new' 
		end	
	end
	
	protected
	
	def user_params
		params.require(:user).permit(:username, :email, :password) 
	end	
end	
