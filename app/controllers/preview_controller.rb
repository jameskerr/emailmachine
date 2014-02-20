class PreviewController < ApplicationController
	include PreviewHelper
	require 'premailer'

	before_filter :issue_number
	before_filter :inline_css, :except => [:index]

	def index
		@template = Template.current
		@stories = Story.order(:position).all
		@jobs 	 = Job.order(:position).all
		@events  = Event.order(:date).all
		@publics = Public.order(:position).all
		@today   = today
		render "#{@template.name}"
  end

  def generate
		render :text => @html
	end

  def raw
		render 'shared/raw', :layout => 'no_assets'
  end
	
	def download
		file_name = today
		fout = File.open("tmp/#{file_name}.html", "w")
		fout.puts @html.html_safe
		fout.close
		send_file("tmp/#{file_name}.html")
	end
end

