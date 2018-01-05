class NotesController < ApplicationController
  before_action :set_note, only: [:show, :edit, :update, :destroy]
        before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
      before_filter :user_is_current_user, only: [:show, :edit, :update, :destroy]


  # GET /notes
  # GET /notes.json
  def index
    if user_signed_in?
      @notes = current_user.notes.order(created_at: 'desc')
      @slidedecks= Slidedeck.all
     
  else 
    redirect_to lessons_url, alert: "Please sign in to access notes"
  end 
  end

  # GET /notes/1
  # GET /notes/1.json
  def show
   
  end

  # GET /notes/new
  def new
      @note = Note.new(:user => @current_user)
      @slidedecks = Slidedeck.all
  end

  # GET /notes/1/edit
  def edit
          @slidedecks = Slidedeck.all

  end

  # POST /notes
  # POST /notes.json
  def create
    @note = Note.new(note_params)
    @note.user_id = current_user.id

    respond_to do |format|
      if @note.save && @note.slidedeck_id?
        format.html { redirect_to @note.slidedeck, notice: 'Note was successfully created.' }
        format.json { render :show, status: :created, location: @note }
      elsif @note.save
        format.html { redirect_to @note, notice: 'Note was successfully created.' }
        format.json { render :show, status: :created, location: @note }
      else
        format.html { render :new }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notes/1
  # PATCH/PUT /notes/1.json
  def update
    respond_to do |format|
      if @note.update(note_params) && @note.slidedeck_id?
        format.html { redirect_to @note.slidedeck, notice: 'Note was successfully updated.' }
        format.json { render :show, status: :ok, location: @note }
      elsif @note.update(note_params)
        format.html { redirect_to @note, notice: 'Note was successfully updated.' }
        format.json { render :show, status: :ok, location: @note }
      else
        format.html { render :edit }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notes/1
  # DELETE /notes/1.json
  def destroy
    @note.destroy
    respond_to do |format|
      format.html { redirect_to notes_url, notice: 'Note was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_note
      @note = Note.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def note_params
      params.require(:note).permit(:slidedeck_id, :title, :content, :user_id)
    end
  def user_is_current_user
    unless current_user == @note.user
      redirect_to(root_url, alert: "You cannot mess with this note") and return
    end
  end
end
