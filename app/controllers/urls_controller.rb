class UrlsController < ApplicationController
	def new
		@url = Url.new
	end

	def create
		@long_url = Url.new(url_params)

		if @long_url.save
			flash[:notice] = 'Successfully created shorter url.'
			redirect_to root_path
		else
			flash[:alert] = "Ops! Something wrong with the url. Remember it need http/http"
			redirect_to root_path
		end
	end

	def show		
		@url = Url.find_by(short_url: params[:short_url])
		if @url.nil?
			flash[:alert] = "Ops! Something wrong with the url. Remember it need http/http"
			redirect_to root_path
		else
			@short_url.counter
			redirect_to @url.short_url
		end
	end

	private
	def url_params
		params.require(:url).permit(:long_url)
	end

end