class RpgController < ApplicationController
  def index
  	if !session["gold"]
  		session["gold"] = 0
  	end
    if !session["message"]
  		session["message"] = ""
  	end
  	render 'rpg/index'
  end

  def control
  	place = params[:place]
  	if place === "farm"
  		random = rand(10..20)
  		session["gold"] = session["gold"] + random
  		session[:message] = session[:message] + "Earned #{random} golds from the Farm! #{Time.now}" + "\n" 
  	elsif place === "cave"
  		random = rand(5..10)
  		session["gold"] = session["gold"] + random
  		session[:message] = session[:message] + "Earned #{random} golds from the Cave! #{Time.now}" + "\n" 
  	elsif place === "house"
  		random = rand(2..5)
  		session["gold"] = session["gold"] + random
  		session[:message] = session[:message] + "Earned #{random} golds from the House! #{Time.now}"  + "\n" 
  	elsif place === "casino"
  		random = rand(-50..50)
  		session["gold"] = session["gold"] + random
  		if random > 0
  			session[:message] = session[:message]+ "Earned #{random} golds from the Casino! #{Time.now}"  + "\n" 
  		else
  			session[:message] = session[:message] + "Lost #{random * -1} golds from the Casino! #{Time.now}" + "\n" 
  		end
  	end		
  	redirect_to '/'
  end

end
