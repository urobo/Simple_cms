class SectionsController < ApplicationController
	
	layout 'admin'
	
	before_filter :confirm_logged_in

	def index
		list
		render('list')
	end

	def list
		@sections = Section.order("sections.position ASC")
	end

	def show
		@section = Section.find(params[:id])
	end

	def new
		@section = Section.new(:content_type => false)
		@section_count = Section.count + 1
	end

	def create
		new_position = params[:section].delete(:position)

		# instantiate a new object using form parameters
		 @section = Section.new(params[:section])
		 # save the object
		 if @section.save
		 	@section.move_to_position(new_position)
		 	# if save succeeds, redirect to the list action
		 	flash[:notice] = "Section Created!"
		 	redirect_to(:action => 'list')
		 else
		 	# if save fails, redisplay the form so user can fix problmes
		 	@section_count = Section.count + 1
		 	render('new')
		 end
	end

	def edit
		@section = Section.find(params[:id])
		@section_count = Section.count
	end

	def update
		@section = Section.find(params[:id])
		new_position = params[:section].delete(:position)
		if @section.update_attributes(params[:section])
			@section.move_to_position(new_position)
			flash[:notice] = "Section Updated!"
			redirect_to(:action => 'show', :id => @section.id)
		else
			@section_count = Section.count
			render('edit')
		end
	end

	def delete
		@section = Section.find(params[:id])
	end

	def destroy
		section = Section.find(params[:id])
		section.move_to_position(nil)
		section.destroy
		flash[:notice] = "Section Destroyed!"
		redirect_to(:action => 'list')
	end

end
