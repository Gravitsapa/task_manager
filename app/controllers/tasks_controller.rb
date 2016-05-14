class TasksController < ApplicationController

	def create
		@project = Project.find(params[:project_id])
		@task = @project.tasks.create(task_params)
		if @task.save
			redirect_to root_path
		else
			render root_path
		end
	end

	def update

	end

	def destroy
		
	end

	private
	
		def task_params
			params.require(:task).permit(:name, :status, :project_id)
		end

end
