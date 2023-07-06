class JobsController < ApplicationController
  before_action :set_job, only: %i[ show edit update destroy apply ]
  before_action :authenticate_company!, only: %i[ new create edit update destroy ]

  # GET /jobs or /jobs.json
  def index
    @jobs = Job.all
  end

  # GET /jobs/1 or /jobs/1.json
  def show
  end

  # GET /jobs/new
  def new
    @job = Job.new
  end

  # GET /jobs/1/edit
  def edit
  end

  # POST /jobs or /jobs.json
  def create
    @job = Job.new(job_params)

    respond_to do |format|
      if @job.save
        format.html { redirect_to job_url(@job), notice: "Job was successfully created." }
        format.json { render :show, status: :created, location: @job }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /jobs/1 or /jobs/1.json
  def update
    respond_to do |format|
      if @job.update(job_params)
        format.html { redirect_to job_url(@job), notice: "Job was successfully updated." }
        format.json { render :show, status: :ok, location: @job }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jobs/1 or /jobs/1.json
  def destroy
    @job.destroy

    respond_to do |format|
      format.html { redirect_to jobs_url, notice: "Job was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def apply
  end

  def oneclickapply
    @job = Job.find(params[:job_id])
    @job_application = JobApplication.new(job: @job, user: current_user)

    # Assign the name, email, and attachment to the job application
    @job_application.name = current_user.name
    @job_application.email = current_user.email
    # @job_application.resume = current_user.attachment

    respond_to do |format|
      if @job_application.save
        format.html { redirect_to @job, notice: "Job application submitted successfully." }
        format.json { render :show, status: :created, location: @job }
      else
        format.html { redirect_to @job, alert: "Failed to submit job application." }
        format.json { render json: @job_application.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job
      @job = Job.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def job_params
      params.require(:job).permit(:title, :description, :company, :location, :employment_type, :salary, :experience_level, :education_level, :skills, :application_deadline, :attachment)
    end
end
