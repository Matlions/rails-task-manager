class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  # GET /task
  def index
    @tasks = Task.all
  end

  # GET /tasks/:id
  def show
    set_task
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # POST /tasks
  def create
    task = Task.new(task_params)
    # task = Task.new(params[:task])
    # => will raise an ActiveRecord::ForbiddenAttributesError
    task.save

    redirect_to tasks_path
  end

  def edit
    # @task = Task.find(params[:id])
  end

  # PATCH /tasks/:id
  def update
    # @task = Task.find(params[:id])
    @task.update(task_params)

    redirect_to task_path(@task)
  end

  def destroy
    # @restaurant = Restaurant.find(params[:id])
    @task.destroy

    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :details)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
