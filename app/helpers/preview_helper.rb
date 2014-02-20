require 'nokogiri'

module PreviewHelper
	def inline_css
		# Get all the locals
		@stories = Story.order(:position).all
		@jobs 	 = Job.order(:position).all
		@events  = Event.order(:position).all
		@publics = Public.order(:position).all
		@today 	 = today
		@template = Template.current
		
		# Get the index page as a string
		@html = render_to_string(:action => "#{@template.name}", 
								 :layout => 'generate', 
								 :locals => { 
								 	:stories => @stories, 
									:jobs => @jobs, 
									:events => @events,
									:publics => @publics,
									:today => @today,
									:issue => @issue,
									:template => @template 
									}
								)
		
		# Remove the action divs
		doc = Nokogiri::HTML(@html)
		doc.css('div.action-menu').remove
		doc.css('title').remove
		
		# Inline the CSS
		premailer = Premailer.new(doc.to_s, :with_html_string => true, base_url: @template.asset_host)
		puts @html = premailer.to_inline_css
	end
	def today
		t = Time.new
		t.month.to_s.rjust(2, '0') + "-" + t.day.to_s.rjust(2,'0') + "-" + t.year.to_s[2..3]
	end
	def issue_number
		seed = Time.new(2013,8,19)
		seconds_dif = Time.now - seed
		days_dif = seconds_dif.to_i / ( 60 * 60 * 24)
		@issue = (days_dif / 7) + 1
	end
end
