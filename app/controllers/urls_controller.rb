class UrlsController < ApplicationController

	respond_to :js

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
			temp_url = Url.find_by_long_url(@url.long_url)
			flash[:alert] = "Ops! #{@url.errors.full_messages.to_sentence}. Here is your short-url - #{temp_url.short_url}"
			redirect_to root_path
		end
	end

	def show		
		@url = Url.find_by(short_url: params[:short_url])
		if @url.nil?
			flash[:alert] = "Ops! Invalid url"
			redirect_to root_path
		else
			@url.counter
			redirect_to @url.long_url
		end
	end

	private
	def url_params
		params.require(:url).permit(:long_url)
	end

end