class SubmissionsController < ApplicationController
      before_action :set_submission, only: [:show, :edit, :update, :destroy]
      before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
      before_filter :check_user, only: [:edit, :update, :destroy]
      before_filter :authorize_admin, only: [:index, :destroy, :edit]


  # GET /submissions
  # GET /submissions.json
  def usergrades 
    if user_signed_in? && current_user.admin?
       
        @assignments = Assignment.all
        @usergrades = User.order(last_name: :asc)
    else
      redirect_to lessons_url, alert: "You don't have permission to do that! Nice try though :)"
    end
  end

  def index
    @search = Submission.search(params[:q])
    @search.sorts = 'created_at DESC' if @search.sorts.empty?
    @submissions = @search.result
    @assignments = Assignment.all

  end

  # GET /submissions/1
  # GET /submissions/1.json
  def show
  end

  # GET /submissions/new
  def new
    @submission = Submission.new(:user => @current_user)
    session[:submission_params] ||= {}
    @submission = Submission.new(session[:submission_params])
    @submission.current_step = session[:submission_step]

  end

  # GET /submissions/1/edit
  def edit

  end

  # POST /submissions
  # POST /submissions.json
def create
  session[:submission_params].deep_merge!(params[:submission]) if params[:submission]
  @submission = Submission.new(session[:submission_params])
  @submission.user_id = current_user.id
  @submission.current_step = session[:submission_step]
  if @submission.valid?
    if params[:back_button]
      @submission.previous_step
    elsif @submission.last_step?
      @submission.save if @submission.all_valid?
    else
      @submission.next_step
    end
    session[:submission_step] = @submission.current_step
  end
  if @submission.new_record?
    render "new"
  else
    session[:submission_step] = session[:submission_params] = nil
    flash[:notice] = "Assignment Submitted!"
    redirect_to @submission
  end

end

  # PATCH/PUT /submissions/1
  # PATCH/PUT /submissions/1.json
  def update

    respond_to do |format|
      if @submission.update(submission_params)
        format.html { redirect_to @submission, notice: 'Submission was successfully updated.' }
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
      params.require(:submission).permit(:assignment_type, :feedback, :delete_image, :image, :homework_id, :user, :name, {assignment_ids: []}, :assignment, :user_id, :assignment_id, :score, :totalscore, :description, :assignment_id, :document)
    end
    def check_user
      if current_user == authorize_admin
        redirect_to root_url, alert: "You don't have permission to do that!"

      end 
    end
end
