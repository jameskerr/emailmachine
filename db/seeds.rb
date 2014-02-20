# Create the admin user (myself) if it doesn't exist

if (admin = User.find_by_email("jkerr@chapman.edu"))
	admin.update_attributes(:approved => true)
	puts "jkerr@chapman.edu exists and has been approved"
else
	User.create({:email => "jkerr@chapman.edu", :password => "12345678", :password_confirmation => "12345678", :approved => true})
	puts "New admin created: jkerr@chapman.edu, 12345678"
end


# Seed the database with stories and events

def random_word
	length = rand(1..10)
	('a'..'z').to_a.shuffle[0,length].join
end

def random_title
	length = rand(1..6)
	a = Array.new(length) { |i| i = random_word.capitalize }
	a.join(" ")
end

def random_sentence
	length = rand(6..12)
	a = Array.new(length) { |i| i = random_word }
	a.join(" ").capitalize + "."
end

def random_para
	length = rand(3..9)
	a = Array.new(length) { |i| i = random_sentence }
	a.join(" ")
end

def random_html_p
	"<p>" + random_para + "</p>"
end

def random_html_ul
	list = "<ul>"
	rand(3..8).times do 
		list += "<li>" + random_title + "</li>"
	end
	list += "</ul>"
end

pics = ["gov-hon.jpg", "large-firm.png","","","jud-clerk.jpg", "",""]
7.times do
	Story.create({
		:archived => false,
		:title => random_title,
		:body => random_html_p + random_html_ul + random_html_p,
		:call_to_action => "Click here",
		:link => "https://google.com",
		:image_name => pics.pop
		})
end

titles = "Law Clerk (Spring),Attorney Honors Program,Worker's Comp Attorney,Post-grad Law Clerk".split(",")
practice_areas = "Employment Law,Entertainment Law,Taxation/Business Corporate,International Law,Environmental Law".split(",")
employers = "Ann Frank Corp,Blizzard Entertainment,Pain & Fears LLC,K&L Gates Law Firm,Flyby Entertainment Law Group".split(",")

5.times do 
	Job.create({
		:title => titles.pop,
		:practice_area => practice_areas.pop,
		:employer => employers.pop,
		:link => "https://google.com"
		})
end

3.times do
	Event.create({
		:title => random_title,
		:date => Date.today + 14,
		:location => "237",
		:link => "https://law-chapman-csm.symplicity.com/students/index.php?ss=ws&_ksl=1&mode=list&s=event"
		})
end

2.times do
	Public.create({
		:title => random_title,
		:body => random_html_p + random_html_p
		})
end

# Seed the template names
Template.create({
	name: 'inside',
	selected: false
	})

Template.create({
	name: 'weekly',
	selected: true,
	asset_host: 'http://www.chapman.edu/email/weekly'
	})

Template.create({
	name: 'classifieds',
	selected: false
	})

Template.create({
	name: 'ebulletin',
	selected: false
	})
