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

	def sort
		params[:task].each_with_index do |k, v| 
			Task.where(params[:project_id]).update(k, priority: v+1) 
		end
		render nothing: true
	end

	private
	
		def task_params
			params.require(:task).permit(:name, :status, :project_id)
		end

end
