class AboutsController < ApplicationController
  before_action :set_about, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_filter :check_user, only: [:edit, :update, :destroy]

  # GET /abouts
  # GET /abouts.json
  def index
    @abouts = About.all
  end

  # GET /abouts/1
  # GET /abouts/1.json
  def show
  end

  # GET /abouts/new
  def new
    @about = About.new
    @about.materials.build
    @about.vitals.build
    @about.objectives.build

  end

  # GET /abouts/1/edit
  def edit
   
  end

  # POST /abouts
  # POST /abouts.json
  def create
    @about = About.new(about_params)
    @about.user_id = current_user.id 
    respond_to do |format|
      if @about.save
        format.html { redirect_to @about, notice: 'About was successfully created.' }
        format.json { render :show, status: :created, location: @about }
      else
        format.html { render :new }
        format.json { render json: @about.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /abouts/1
  # PATCH/PUT /abouts/1.json
  def update
    respond_to do |format|
      if @about.update(about_params)
        format.html { redirect_to @about, notice: 'About was successfully updated.' }
        format.json { render :show, status: :ok, location: @about }
      else
        format.html { render :edit }
        format.json { render json: @about.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /abouts/1
  # DELETE /abouts/1.json
  def destroy
    @about.destroy
    respond_to do |format|
      format.html { redirect_to abouts_url, notice: 'About was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_about
      @about = About.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def about_params
      params.require(:about).permit(:document, :id, :user_id, :name, :description, objectives_attributes: [:id, :content, :_destroy], materials_attributes: [:id, :description, :_destroy], vitals_attributes: [:id, :description, :_destroy])
    end
     def check_user
      if current_user != @about.user
        redirect_to root_url, alert: "You don't have permission to do that!"
      end 
     
    end
end
