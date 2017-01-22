class UrlsController < ApplicationController

	respond_to :js, :html

	def new
		@url = Url.new
	end

	def create
		@url = Url.new(url_params)

		if @url.save
			flash[:notice] = 'Successfully created shorter url.'
			respond_to do |format|  
        format.js { render 'urls/show_update', long_url: @url.long_url, short_url: @url.short_url}
    	end  
		else
			flash[:alert] = "Ops! Something wrong with the url. Remember it need http/http"
			redirect_to "/url.#{@url.id}"		
		end
	end

	def show		
		# @url = Url.find_by(short_url: params[:short_url])
		# if @url.nil?
		# 	flash[:alert] = "Ops! Something wrong with the url. Remember it need http/http"
		# 	redirect_to root_path
		# else
		# 	@short_url.counter
		# 	redirect_to @url.short_url
		# end
	end

	private
	def url_params
		params.require(:url).permit(:long_url)
	end

end