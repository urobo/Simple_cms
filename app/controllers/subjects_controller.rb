	class SubjectsController < ApplicationController
	
	layout 'admin'

	before_filter :confirm_logged_in
	
	def index
		list
		render('list')
	end

	def list
		@subjects = Subject.order("subjects.position ASC")
	end
	
	def show
		@subject = Subject.find(params[:id])
	end

	def new
		@subject = Subject.new(:name => 'default')
		@subject_count = Subject.count + 1
	end

	def create
		 new_position = params[:subject].delete(:position)
		 # instantiate a new object using form parameters
		 @subject = Subject.new(params[:subject])
		 # save the object
		 if @subject.save
		 	@subject.move_to_position(new_position)
		 	# if save succeeds, redirect to the list action
		 	flash[:notice] = "Subject Created!"
		 	redirect_to(:action => 'list')
		 else
		 	# if save fails, redisplay the form so user can fix problmes
		 	@subject_count = Subject.count +  1
		 	render('new')
		 end
	end

	def edit
		@subject = Subject.find(params[:id])
		@subject_count = Subject.count
	end

	def update
		# find object from parameters
		@subject = Subject.find(params[:id])
		new_position = params[:subject].delete(:position)

		# update the object
		if @subject.update_attributes(params[:subject])
			@subject.move_to_position(new_position)

			# if update succeeds. redirect to list action
			flash[:notice] = "Subject Updated!"
			redirect_to(:action => 'show', :id => @subject.id)
		else
			# fi update fails, redisplay the form so user can fix problems
			@subject_count = Subject.count
			render('edit')
		end
	end

	def delete
		@subject = Subject.find(params[:id])
	end

	def destroy
		# find object from params and destroy
		subject = Subject.find(params[:id])
		subject.move_to_position(nil)
		subject.destroy
		flash[:notice] = "Subject deleted!"
		redirect_to(:action => 'list')
	end

end
