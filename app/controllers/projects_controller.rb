class ProjectsController < ApplicationController

	before_action :find_project, only: [:edit, :update, :destroy]

	def index
		@projects = Project.all
		@project = Project.new
	end

	def create
		@project = Project.new(project_params)
		if @project.save
			redirect_to root_path
		else
			render 'new'
		end
	end

	def edit
		
	end

	def update
		
	end

	def destroy
		@project.destroy
		redirect_to root_path
	end

	private

		def project_params
			params.require(:project).permit(:name)
		end

		def find_project
			@project = Project.find params[:id]
		end
end
