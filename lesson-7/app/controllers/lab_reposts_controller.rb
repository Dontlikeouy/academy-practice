class LabRepostsController < ApplicationController
  before_action :set_lab_repost, only: %i[ show edit update destroy ]

  # GET /lab_reposts or /lab_reposts.json
  def index
    @lab_reposts = LabRepost.all
  end

  # GET /lab_reposts/1 or /lab_reposts/1.json
  def show
  end

  # GET /lab_reposts/new
  def new
    @lab_repost = LabRepost.new
  end

  # GET /lab_reposts/1/edit
  def edit
  end

  # POST /lab_reposts or /lab_reposts.json
  def create
    @lab_repost = LabRepost.new(lab_repost_params)

    respond_to do |format|
      if @lab_repost.save
        format.html { redirect_to lab_repost_url(@lab_repost), notice: "Lab repost was successfully created." }
        format.json { render :show, status: :created, location: @lab_repost }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @lab_repost.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lab_reposts/1 or /lab_reposts/1.json
  def update
    respond_to do |format|
      if @lab_repost.update(lab_repost_params)
        format.html { redirect_to lab_repost_url(@lab_repost), notice: "Lab repost was successfully updated." }
        format.json { render :show, status: :ok, location: @lab_repost }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @lab_repost.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lab_reposts/1 or /lab_reposts/1.json
  def destroy
    @lab_repost.destroy!

    respond_to do |format|
      format.html { redirect_to lab_reposts_url, notice: "Lab repost was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lab_repost
      @lab_repost = LabRepost.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def lab_repost_params
      params.require(:lab_repost).permit(:user_id, :title, :description, :grade)
    end
end
