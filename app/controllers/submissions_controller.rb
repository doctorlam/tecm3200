class SubmissionsController < ApplicationController
      before_action :set_submission, only: [:show, :edit, :update, :destroy]
      before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
      before_filter :check_user, only: [:edit, :update, :destroy]
      before_filter :authorize_admin, only: [:index, :destroy, :edit]


  # GET /submissions
  # GET /submissions.json
   def instructor_gradebook
    @submissions = Submission.all.where(creator: current_user).order("created_at DESC")
    @assignments = Assignment.all
  end
  
  def student_history
    @submissions = Submission.all.where(student: current_user).order("created_at DESC")
    @assignments = Assignment.all
  end

  def index
    @search = Submission.all
  end

  # GET /submissions/1
  # GET /submissions/1.json
  def show
  end

  # GET /submissions/new
  def new
    @submission = Submission.new
    @assignment = Assignment.find(params[:assignment_id])
  end

  # GET /submissions/1/edit
  def edit

  end

  # POST /submissions
  # POST /submissions.json
def create
    @submission = Submission.new(submission_params)
    @assignment = Assignment.find(params[:assignment_id])
    @creator = @assignment.user
    @submission.assignment_id = @assignment.id
    @submission.student_id = current_user.id
    @submission.creator_id = @creator.id

    respond_to do |format|
      if @submission.save
        format.html { redirect_to student_history_url, notice: 'Submission was successfully created.' }
        format.json { render :show, status: :created, location: @submission }
      else
        format.html { render :new }
        format.json { render json: @submission.errors, status: :unprocessable_entity }
      end
    end

end

  # PATCH/PUT /submissions/1
  # PATCH/PUT /submissions/1.json
  def update

    respond_to do |format|
      if @submission.update(submission_params)
        format.html { redirect_to student_history_url, notice: 'Submission was successfully updated.' }
        format.json { render :show, status: :ok, location: @submission }
      else
        format.html { render :edit }
        format.json { render json: @submission.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /submissions/1
  # DELETE /submissions/1.json
  def destroy

    @submission.destroy
    respond_to do |format|
      format.html { redirect_to submissions_url, notice: 'Submission was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_submission
      @submission = Submission.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def submission_params
      params.require(:submission).permit(:assignment_id, :id, :feedback, :delete_image, :image, :homework_id, :user, :name, {assignment_ids: []}, :assignment, :user_id, :assignment_id, :score, :totalscore, :description, :assignment_id, :document)
    end
    def check_user
      if current_user == authorize_admin
        redirect_to root_url, alert: "You don't have permission to do that!"

      end 
    end
end
