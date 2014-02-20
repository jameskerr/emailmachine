class JobsController < ApplicationController
  # GET /jobs
  # GET /jobs.json
  def index
    @jobs = Job.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @jobs }
    end
  end

  # GET /jobs/1
  # GET /jobs/1.json
  def show
    @job = Job.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @job }
    end
  end

  # GET /jobs/new
  # GET /jobs/new.json
  def new
    @job = Job.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @job }
    end
  end

  # GET /jobs/1/edit
  def edit
    @job = Job.find(params[:id])
  end

  # POST /jobs
  # POST /jobs.json
  def create
    @job = Job.new(params[:job])

    respond_to do |format|
      if @job.save
        format.html { 
				if params[:add_another]
					redirect_to :action => 'new', notice: 'Saved'
				else
					redirect_to preview_url, notice: 'Job was successfully created.' 
				end
				}
        format.json { render json: @job, status: :created, location: @job }
      else
        format.html { render action: "new" }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /jobs/1
  # PUT /jobs/1.json
  def update
    @job = Job.find(params[:id])

    respond_to do |format|
      if @job.update_attributes(params[:job])
        format.html { redirect_to preview_url, notice: 'Job was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jobs/1
  # DELETE /jobs/1.json
  def destroy
    @job = Job.find(params[:id])
    @job.destroy

    respond_to do |format|
      format.html { redirect_to preview_url }
      format.json { head :no_content }
    end
  end
	
	def sort		
			job_ids = params["jobs"]
			counter = 1
			job_ids.each do |id|
				current_job = Job.find(id)
				current_job.position = counter
				current_job.save
				counter +=1
			end
			render :nothing => true
	end
	
	def delete_all
		Job.delete_all
		redirect_to preview_url
	end
end
