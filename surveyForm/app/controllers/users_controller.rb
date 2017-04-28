class UsersController < ApplicationController
  private
  $user

  def user_params
  	params.require(:user).permit(:name, :dojo_location, :fav_language, :comment)
  end
 

  public

  def index
  	render 'index'
  end

  def show
  	@user = User.find(session[$user]["user_id"])
  	render '/users/result'
  end


  def new
  	user = User.where( name: user_params[:name] )
  	if user.any?
  		user_updated = user[0].update( user_params )
  		if user_updated == false
  			flash["errors"] = user_updated.errors.full_messages
  			redirect_to '/users/index'
  		else
  			$user = user[0].id
  			session[$user]["user_id"] = user[0].id
  			session[$user]["count"] = session[$user]["count"] + 1
  			flash["success"] = "Thanks for submitting this form! You have submitted this form #{session[$user]['count']} time(s) now"
  			redirect_to '/users/result'
  		end
  	else
  	  	user =  User.create( user_params )
  	  	$user = user.id
  		if user.errors.any?
  			flash["errors"] = user.errors.full_messages
  			redirect_to '/users/index'
  		else
  			session[$user] = { user_id: user.id, count: 1 }
  			flash["success"] = "Thanks for submitting this form! You have submitted this form #{session[$user][:count]} times now"
  			redirect_to '/users/result'
  		end
  	end

  end 

  def _404
  	render text: "No Page with that URL"
  end




end
