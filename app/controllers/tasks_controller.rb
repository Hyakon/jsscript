class TasksController < ApplicationController
before_action :authenticate_user!
  def new
    @categories = Category.all
  end

  def create
    @task = Task.new(task_params)
    @category = Category.find(category_params)
    @task.category = @category

    respond_to do |format|
      if @task.save

        format.html do
          redirect_to root_path
          flash[:notice] = "Task created"
        end

        format.js
      else
        format.html do
          redirect_to root_path
          flash[:notice] = "Please try again"
        end
        format.js
      end
    end

    
  end

  def edit
    @task = Task.find(params[:id])
    @categories = Category.all

  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to tasks_path
    flash[:notice] = "Task edited"
  end

  def index
    @tasks = Task.all
  end

  def destroy
    respond_to do |format|
      @task = Task.find(params[:id])
      @task.destroy
      format.html do
        redirect_to root_path
      end
      
      format.js
    end
  end


  private

  def task_params
    params.permit(:title, :deadline, :description)
  end

  def category_params
    params.require(:Category)
  end

end
