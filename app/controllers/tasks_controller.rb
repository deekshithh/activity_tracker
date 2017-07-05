class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user
  before_action :set_task, only: [:show, :edit,:update, :destroy]
  before_action :destroy_tactivities, only: [:destroy]
  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = @user.tasks.all
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(task_params)
    @task.user_id= @user.id
    respond_to do |format|
      if @task.save
        flash[:success]= "Task was successfully created."
        format.html { redirect_to @task }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
         flash[:success]= "Task was successfully updated."
        format.html { redirect_to @task }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    flash[:danger]= "Task was successfully destroyed."
    respond_to do |format|
      format.html { redirect_to tasks_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      begin
      @task = current_user.tasks.find(params[:id])
      rescue ActiveRecord::RecordNotFound => e
      @task= nil
      redirect_to root_path
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:name, :description, :start, :end)
    end
    def set_user
      @user= current_user
    end
    def destroy_tactivities
     @task.tactivities.delete_all   
   end

end
