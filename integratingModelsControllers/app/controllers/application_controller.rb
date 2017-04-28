class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
 

  def show
  	if params[:id] == nil
  		render json: User.all
  	elsif User.find_by_id(params[:id]) == nil
  		render text: "ID not found"
  	else
  		render json: User.find_by_id(params[:id])
  	end
  end

  def new
  	render "/users/new.html.erb"
  end

  def create
  	User.create(name: params[:name])
  	redirect_to "/users"
  end

  def edit
  	user = User.find_by_id( params[:id] )
  	if user == nil
  		render text: "ID not found"
  	else
  		@user_id = user.id
  		@user_name = user.name
		render '/users/edit'
	end
  end

  def update
  	user = User.find_by_id( params[:id] )
  	user.update(name: params[:name])
  	redirect_to '/users'
  end

  def total
	@total = User.all().count
	render text: "Total is #{@total}"
  end












end
