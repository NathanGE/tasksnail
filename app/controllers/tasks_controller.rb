class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  respond_to :html, :json

  def index
    @tasks = Task.all
  end

  def show
  end

  def new
    @task = Task.new
  end

  def edit
  end

  def create
    @user = current_user
    @task = Task.new(task_params)

    if @user.soft_user?
      @task.soft_token = @user.soft_token
    end

    @task.save
    respond_with(@task)
  end

  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @task, notice: 'Task was successfully updated.' }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: 'Task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_task
      @task = Task.find(params[:id])
    end


    def task_params
      params.require(:task).permit(:name, :complete, :user_id)
    end
end
