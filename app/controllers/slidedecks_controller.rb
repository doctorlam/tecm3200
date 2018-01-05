class SlidedecksController < ApplicationController
  before_action :set_slidedeck, only: [:show, :edit, :update, :destroy]
before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_filter :check_user, only: [:edit, :update, :destroy]
  before_filter :authorize_admin, only: [:new, :create, :destroy, :edit]
before_filter :set_cache_headers

  # GET /slidedecks
  # GET /slidedecks.json
  def index
    @slidedecks = Slidedeck.order(created_at: :asc)
  end

  # GET /slidedecks/1
  # GET /slidedecks/1.json
  def show
        @note = Note.new
        @slidedecks = Slidedeck.all

  end

  # GET /slidedecks/new
  def new
    @slidedeck = Slidedeck.new

  end

  # GET /slidedecks/1/edit
  def edit
  end

  # POST /slidedecks
  # POST /slidedecks.json
  def create
    @slidedeck = Slidedeck.new(slidedeck_params)

    respond_to do |format|
      if @slidedeck.save
        format.html { redirect_to @slidedeck, notice: 'Slidedeck was successfully created.' }
        format.json { render :show, status: :created, location: @slidedeck }
      else
        format.html { render :new }
        format.json { render json: @slidedeck.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /slidedecks/1
  # PATCH/PUT /slidedecks/1.json
  def update
    respond_to do |format|
      if @slidedeck.update(slidedeck_params)
        format.html { redirect_to @slidedeck, notice: 'Slidedeck was successfully updated.' }
        format.json { render :show, status: :ok, location: @slidedeck }
      else
        format.html { render :edit }
        format.json { render json: @slidedeck.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /slidedecks/1
  # DELETE /slidedecks/1.json
  def destroy
    @slidedeck.destroy
    respond_to do |format|
      format.html { redirect_to slidedecks_url, notice: 'Slidedeck was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_slidedeck
      @slidedeck = Slidedeck.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def slidedeck_params
      params.require(:slidedeck).permit(:delete_image, :caption, :bgcolor, :image, :title, slides_attributes: [:id, :delete_image, :caption, :color_scheme, :image, :bgimage, :bgcolor, :title, :content, :slide_order, :_destroy, contentmodules_attributes: [:id, :_destroy, :modular_content], bulleted_lists_attributes: [:id, :_destroy, :list, bullet_attributes: [:id, :list_item, :_destroy]]])
    end
    def check_user
      if current_user == authorize_admin
        redirect_to root_url, alert: "You don't have permission to do that!"
      end 
    end
    def set_cache_headers
      response.headers["Cache-Control"] = "no-cache, no-store"
      response.headers["Pragma"] = "no-cache"
      response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"
    end
  end

