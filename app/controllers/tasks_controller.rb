class TasksController < ApplicationController
  before_action :set_pet, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def show
  end

  def new
    @task = Task.new # Needed to instantiate the form_with
  end

  def create
    @task = Task.new(task_params)
    @task.save # Will raise ActiveModel::ForbiddenAttributesError
    redirect_to tasks_path
  end

  def edit
  end

  def update
    @task.update(task_params)
    redirect_to task_path(@task)
  end

  def destroy
    @task.destroy
    # No need for app/views/tasks/destroy.html.erb
    redirect_to tasks_path, status: :see_other
  end

  def set_pet
    @task = Task.find(params[:id])
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
