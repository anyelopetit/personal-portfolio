# frozen_string_literal: true

require_dependency 'keppler_cv/application_controller'
module KepplerCv
  module Admin
    # ProjectsController
    class ProjectsController < ::Admin::AdminController
      layout 'keppler_cv/admin/layouts/application'
      before_action :set_project, only: %i[show edit update destroy]
      before_action :index_variables
      include ObjectQuery

      # GET cv/projects
      def index
        respond_to_formats(@projects)
        # redirect_to_index(@objects)
      end

      # GET cv/projects/1
      def show; end

      # GET cv/projects/new
      def new
        @project = model.new
      end

      # GET cv/projects/1/edit
      def edit; end

      # POST cv/projects
      def create
        @project = Project.new(project_params)

        if @project.save
          redirect(@project, params)
        else
          render :new
        end
      end

      # PATCH/PUT cv/projects/1
      def update
        if @project.update(project_params)
          redirect(@project, params)
        else
          render :edit
        end
      end

      def clone
        @project = Project.clone_record params[:project_id]
        @project.save
        redirect_to_index(@objects)
      end

      # DELETE cv/projects/1
      def destroy
        @project.destroy
        redirect_to_index(@objects)
      end

      def destroy_multiple
        Project.destroy redefine_ids(params[:multiple_ids])
        redirect_to_index(@objects)
      end

      def upload
        Project.upload(params[:file])
        redirect_to_index(@objects)
      end

      def reload; end

      def sort
        Project.sorter(params[:row])
      end

      private

      def index_variables
        @q = Project.ransack(params[:q])
        @projects = @q.result(distinct: true)
        @objects = @projects.page(@current_page).order(position: :desc)
        @total = @projects.size
        @attributes = Project.index_attributes
      end

      # Use callbacks to share common setup or constraints between actions.
      def set_project
        @project = Project.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def project_params
        params.require(:project).permit(:image, :name, :description, :url, :active, :position, :deleted_at)
      end
    end
  end
end
