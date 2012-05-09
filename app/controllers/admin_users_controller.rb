class AdminUsersController < ApplicationController
	layout 'admin'

	before_filter :confirm_logged_in

	def index
		list
		render('list')
	end

	def list
		@admins = AdminUser.sorted
	end

	def show
		@admin = AdminUser.find(params[:id])
	end

	def new
		@admin = AdminUser.new
	end

	def create
		@admin = AdminUser.new(params[:admin_user])
		if @admin.save 
			flash[:notice] = "AdminUser Created!"
			redirect_to(:action => 'list')
		else
			render('new')
		end
	end

	def edit
		@admin = AdminUser.find(params[:id])
	end

	def update
		@admin = AdminUser.find(params[:id])
		if @admin.update_attributes(params[:admin_user])
			flash[:notice] = "Admin User data Updated!"
			redirect_to(:action => 'show', :id => @admin.id)
		else
			render('edit')
		end
	end

	def delete
		@admin = AdminUser.find(params[:id])
	end

	def destroy
		AdminUser.find(params[:id]).destroy
		flash[:notice] = "Admin User Destroyed!"
		redirect_to(:action => 'list')
	end

	
end

end
