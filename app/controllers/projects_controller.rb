class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_filter :check_user, only: [:edit, :update, :destroy]

  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.all.reorder(due: :asc)

  end

  # GET /projects/1
  # GET /projects/1.json
  def show

  end

  # GET /projects/new
  def new
    @project = Project.new
    @project.deliverables.build
    @project.rubrics.build
    @project.related.build
  end

  # GET /projects/1/edit
  def edit
  
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(project_params)
    @project.user_id = current_user.id 
    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit({lesson_ids: []},:id, :due, :lesson, :user_id, :name, :description, :project_id, rubrics_attributes: [:id, :description, :_destroy], deliverables_attributes: [:id, :description, :_destroy], related_attributes: [:description, :id, :_destroy])
    end

     def check_user
      if current_user != @project.user
        redirect_to root_url, alert: "You don't have permission to do that!"
      end 
    end
end
