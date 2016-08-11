class ProjectsController < ApplicationController

	before_action :find_project, only: [:edit, :update, :destroy]

	def index
		@projects = Project.all
	end

	def new
		@project = Project.new
		render layout: false
	end

	def create
		@project = Project.create!(project_params)
		respond_to do |format|
			format.html { redirect_to(root_path) }
			format.js
		end
		
	end

	def edit
		respond_to do |format|
			format.js
		end
	end

	def update
		respond_to do |format|
			if @project.update_attributes(project_params) 
				format.html { redirect_to root_path }
				format.js
			else
				format.html { render 'edit' }
			end
		end
		
	end

	def destroy
		@project.destroy
		respond_to do |format|
			format.html { redirect_to root_path }
			format.js
		end
		
	end

	private

		def project_params
			params.require(:project).permit(:name)
		end

		def find_project
			@project = Project.find params[:id]
		end
end
