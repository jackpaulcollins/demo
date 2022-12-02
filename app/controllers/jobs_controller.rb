class JobsController < ApplicationController
  before_action :set_job, only: %i[ show edit update destroy ]

  # GET /jobs or /jobs.json
  def index
    @jobs = Job.all
  end

  # GET /jobs/1 or /jobs/1.json
  def show
  end

  # GET /jobs/new
  def new
    if job_params.present?
      return @job = Job.new(job_template_id: job_params[:job_template_id])
    end

    @job = Job.new
  end

  # GET /jobs/1/edit
  def edit
  end

  def build_answers(answers)
    [answers].each do |answer|
      attribute = @job.job_template.job_attributes.where(id: answer[:job_attribute_id]).first
      JobAttributeAnswer.create(job_attribute: attribute, answer: answer[:answer])
    end
  end


  def create
    @job = Job.new(job_params.except(:job_template_attribute_answers))

    build_answers(job_params[:job_template_attribute_answers].to_h)

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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job
      @job = Job.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def job_params
      params.fetch(:job, {}).permit(:name, 
                                    :job_template_id, 
                                    job_template_attribute_answers: [:job_attribute_id, :answer])
    end
end
