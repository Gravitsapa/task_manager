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
	end

	def update
		if @project.update_attributes(project_params) 
			redirect_to root_path
		else
			render 'edit'
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
