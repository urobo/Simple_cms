# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#AdminUsers
params = {:riccardo => {:first_name => "Riccardo", :last_name => "Buttarelli", :email => 'rico.sleeps@gmail.com', :password => 'secretpassword', :username =>"ouroboros"},
			:daniel => {:first_name => "Daniel", :last_name => "Colm", :email => 'daniel.colm@gmail.com', :password => 'secretpassword', :username => 'daniel.colm'},
			:alice => {:first_name => "Alice", :last_name => "Buttarelli", :email => 'alice.buttarelli@gmail.com', :password => 'secretpassword', :username => 'alice.buttarelli'}}

params.keys.each do |key|
	user = AdminUser.new
	user.update_attributes(params[key])
end

#Pages
params = nil
params = {:first_page => {:name => "first page", :permalink => 'first',:position => 1, :visible => true }, 
			:second_page => {:name => "secondo page", :permalink => 'second',:position => 2, :visible => false },
			:third_page => {:name => "third page", :permalink => 'third',:position => 3, :visible => true }}

params.keys.each do |key|
	page = Page.new
	page.update_attributes(params[key])
end

#Sections
params = nil
params = {:first_section => {:name => "first section", :position => 1, :content_type =>"text", :content=> "lorem ipsum", :visible => true},
			:second_section => {:name => "second section", :position => 2, :content_type => "text" , :content=> "dolor sit amet", :visible => true},
			:third_section => {:name => "third section", :position => 3, :content_type => "text", :content=> "consectetur adipiscing elit", :visible => false}}

params.keys.each do |key|
	section = Section.new
	section.update_attributes(params[key])
end

#Subjects
params = nil
params = {:first_subject => {:name => "first subject", :position => 1, :visible => true},
			:second_subject => {:name => "second subject", :position => 2, :visible => true},
			:third_subject => {:name => "third subject", :position => 3, :visible => true}}

params.keys.each do |key|
	subject = Subject.new
	subject.update_attributes(params[key])
end
