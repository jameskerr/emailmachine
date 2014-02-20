class PublicsController < ApplicationController
  # GET /publics
  # GET /publics.json
  def index
    @publics = Public.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @publics }
    end
  end

  # GET /publics/1
  # GET /publics/1.json
  def show
    @public = Public.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @public }
    end
  end

  # GET /publics/new
  # GET /publics/new.json
  def new
    @public = Public.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @public }
    end
  end

  # GET /publics/1/edit
  def edit
    @public = Public.find(params[:id])
  end

  # POST /publics
  # POST /publics.json
  def create
    @public = Public.new(params[:public])

    respond_to do |format|
      if @public.save
        format.html { redirect_to preview_url, notice: 'Public was successfully created.' }
        format.json { render json: @public, status: :created, location: @public }
      else
        format.html { render action: "new" }
        format.json { render json: @public.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /publics/1
  # PUT /publics/1.json
  def update
    @public = Public.find(params[:id])

    respond_to do |format|
      if @public.update_attributes(params[:public])
        format.html { redirect_to preview_url, notice: 'Public was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @public.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /publics/1
  # DELETE /publics/1.json
  def destroy
    @public = Public.find(params[:id])
    @public.destroy

    respond_to do |format|
      format.html { redirect_to preview_url }
      format.json { head :no_content }
    end
  end

  def sort    
    public_ids = params["publics"]
    counter = 1
    public_ids.each do |id|
      current_public = Public.find(id)
      current_public.position = counter
      current_public.save
      counter +=1
    end
    render :nothing => true
  end
end
