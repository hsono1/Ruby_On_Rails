class UsersController < ApplicationController
	def hello
		render text: "Hello Coding Dojo"
	end
	def say_index
		render text: "What do you want me to say?"
	end
	def say
		if params[:word] == nil
			render text: "Hello"
		else
			render text: "#{params[:word].capitalize}"
		end
	end
	def say_name
		if params[:name] == 'Michael'
			redirect_to "/say/#{params[:word]}/joe" 
		else
			render text: "Saying #{params[:word].capitalize} #{params[:name].capitalize}"
		end
	end
	def times
		if session[:count] == nil
			session[:count] = 0
		else
			session[:count] = session[:count] + 1
		end
		render text: "#{session[:count]}"
	end
	def times_reset
		session.delete(:count)
		render text: "Destroy the session"
	end
end
