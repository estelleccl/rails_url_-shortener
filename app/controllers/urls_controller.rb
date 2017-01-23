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
			temp_url = Url.find_by_sql("SELECT * FROM urls WHERE long_url = '#{@url.long_url}'")
			flash[:alert] = "Ops! #{@url.errors.full_messages.to_sentence}. Here is your short-url -#{request.base_url}/#{temp_url.first.short_url}"
			redirect_to root_path
		end
	end

	def show
		if Url.pluck(:short_url).include?(params[:short_url])
			@url = Url.find_by(short_url: params[:short_url])
			@url.counter
			redirect_to @url.long_url
		else
			flash[:alert] = "Ops! Invalid url"
			redirect_to root_path
		end
	end

	def stress_test
		render 'urls/stress'
	end

	private
	def url_params
		params.require(:url).permit(:long_url)
	end

end

