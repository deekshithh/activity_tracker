class TactivitiesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_task
  before_action :set_activity, only: [:show, :edit, :update, :destroy]
  #before_action :authenticate_params_task, only: [:show, :edit, :index]
  #before_action :authenticate_params_activity, only: [:show, :edit]
  #before_action :destroy_tactivities, only: [:destroy]
 
  # GET /tactivities
  # GET /tactivities.json
  def index
    @tactivities = @task.tactivities.order("created_at DESC").all

  end

  # GET /tactivities/1
  # GET /tactivities/1.json
  def show

  end

  # GET /tactivities/new
  def new
    @tactivity = Tactivity.new
  end

  # GET /tactivities/1/edit
  def edit
  end

  # POST /tactivities
  # POST /tactivities.json
  def create
    @tactivity = @task.tactivities.build(tactivity_params)
    
    respond_to do |format|
      if @tactivity.save
        flash[:success]= 'Tactivity was successfully created.' 
        format.html { redirect_to task_tactivities_path(@task)}
        format.json { render :show, status: :created, location: @tactivity }
      else
        format.html { render :new }
        format.json { render json: @tactivity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tactivities/1
  # PATCH/PUT /tactivities/1.json
  def update
    respond_to do |format|
      if @tactivity.update(tactivity_params)
        flash[:success]= 'Tactivity was successfully updated.' 
        format.html { redirect_to task_tactivities_path(@task)}
        format.json { render :show, status: :ok, location: @tactivity }
      else
        format.html { render :edit }
        format.json { render json: @tactivity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tactivities/1
  # DELETE /tactivities/1.json
  def destroy
    @tactivity.destroy
    flash[:danger]= 'Tactivity was successfully deleted.'
    respond_to do |format|
      format.html { redirect_to task_tactivities_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_activity
      begin
      @tactivity = @task.tactivities.find(params[:id])
      rescue ActiveRecord::RecordNotFound => e
      @tactivity= nil
      redirect_to root_path
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tactivity_params
      params.require(:tactivity).permit(:name, :description, :start_date, :hours)
    end

    def set_task
      begin
      @task = current_user.tasks.find(params[:task_id])
      rescue ActiveRecord::RecordNotFound => e
      @task= nil
      redirect_to root_path
      end
    end
end