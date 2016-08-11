class TasksController < ApplicationController

	before_action :find_task, only: [:edit, :update, :destroy]

	def create
		@project = Project.find(params[:project_id])
		@task = @project.tasks.build(task_params)
		respond_to do |format|
			if @task.save
				format.html { redirect_to root_path }
				format.js
			else
				render root_path
			end
		end
		
	end

	def edit
		respond_to do |format|
			format.js
		end
	end

	def update
		respond_to do |format|
			if @project.tasks.find(@task).update_attributes(task_params)
				format.html { redirect_to root_path }
				format.js
			else
				render 'edit'
			end
		end
	end

	def destroy
		@project.tasks.find(@task).destroy
		respond_to do |format|
			format.html { redirect_to root_path }
			format.js
		end
	end

	def sort
		params[:task].each_with_index do |k, v| 
			Task.where(params[:project_id]).update(k, priority: v+1) 
		end
		render body: nil
	end

	private
	
		def task_params
			params.require(:task).permit(:name, :status, :project_id)
		end

		def find_task
			@project = Project.find(params[:project_id])
			@task = Task.find(params[:id])
		end

end
