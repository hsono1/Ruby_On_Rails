class TimesController < ApplicationController
  def main
  	time = Time.now
  	@time = time.strftime("%b %d, %Y")
  	@hour = time.strftime("%H:%M %P")
  	render 'times/main'
  end

   def _404
  	render text: "No page for that url"
  end
end
