class LessonsController < ApplicationController
  before_action :set_lesson, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_filter :check_user, only: [:edit, :update, :destroy]
  before_filter :authorize_admin, only: [:new, :create, :destroy, :edit]
  # GET /lessons
  # GET /lessons.json
  def index
  @search = Lesson.search(params[:q])
  @search.sorts = 'date' if @search.sorts.empty?
  @results = @search.result
  @results = @results.where(:lesson_type => "Main") unless params[:q]
  @lessons = @results
  
end


  # GET /lessons/1
  # GET /lessons/1.json
  def show
  end

  # GET /lessons/new
  def new
    @lesson = Lesson.new
    @lesson.objectives.build
    @lesson.readings.build
    @lesson.homeworks.build
    @lesson.classactivitys.build

  end

  # GET /lessons/1/edit
  def edit
    
  end
  
  # POST /lessons
  # POST /lessons.json
  def create

   @lesson = Lesson.new(lesson_params)
    @lesson.user_id = current_user.id

    respond_to do |format|
      if @lesson.save
        format.html { redirect_to @lesson, notice: 'Lesson was successfully created.' }
        format.json { render :show, status: :created, location: @lesson }
      else
        format.html { render :new }
        format.json { render json: @lesson.errors, status: :unprocessable_entity }
      end
      

    end
  end
 

  # PATCH/PUT /lessons/1
  # PATCH/PUT /lessons/1.json
  def update
    respond_to do |format|
      if @lesson.update(lesson_params)
        format.html { redirect_to @lesson, notice: 'Lesson was successfully updated.' }
        format.json { render :show, status: :ok, location: @lesson }
      else
        format.html { render :edit }
        format.json { render json: @lesson.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lessons/1
  # DELETE /lessons/1.json
  def destroy
    @lesson.destroy
    respond_to do |format|
      format.html { redirect_to lessons_url, notice: 'Lesson was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lesson
      @lesson = Lesson.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lesson_params
      params.require(:lesson).permit({project_ids: []},{assignment_ids: []}, {presentation_ids: []}, :lesson_type, :delete_document, :delete_image, :project_id, :thread, :course_id, :name, :week, :date, :image, :document, :document2, :attachment,
      objectives_attributes: [:id, :content, :_destroy],  readings_attributes: [:id, :content, :_destroy], takeaways_attributes: [:id, :content, :_destroy], homeworks_attributes: [:id, :content, :_destroy, :assignment_id,{assignment_ids: []}],
      classactivitys_attributes: [:id, :content, :_destroy])

    end
    def check_user
      if current_user == authorize_admin
        redirect_to root_url, alert: "You don't have permission to do that!"
      end 

    end
end
