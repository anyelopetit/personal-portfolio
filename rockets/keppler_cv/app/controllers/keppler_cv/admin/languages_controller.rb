# frozen_string_literal: true

require_dependency 'keppler_cv/application_controller'
module KepplerCv
  module Admin
    # LanguagesController
    class LanguagesController < ::Admin::AdminController
      layout 'keppler_cv/admin/layouts/application'
      before_action :set_language, only: %i[show edit update destroy]
      before_action :index_variables
      include ObjectQuery

      # GET cv/languages
      def index
        respond_to_formats(@languages)
        # redirect_to_index(@objects)
      end

      # GET cv/languages/1
      def show; end

      # GET cv/languages/new
      def new
        @language = model.new
      end

      # GET cv/languages/1/edit
      def edit; end

      # POST cv/languages
      def create
        @language = Language.new(language_params)

        if @language.save
          redirect(@language, params)
        else
          render :new
        end
      end

      # PATCH/PUT cv/languages/1
      def update
        if @language.update(language_params)
          redirect(@language, params)
        else
          render :edit
        end
      end

      def clone
        @language = Language.clone_record params[:language_id]
        @language.save
        redirect_to_index(@objects)
      end

      # DELETE cv/languages/1
      def destroy
        @language.destroy
        redirect_to_index(@objects)
      end

      def destroy_multiple
        Language.destroy redefine_ids(params[:multiple_ids])
        redirect_to_index(@objects)
      end

      def upload
        Language.upload(params[:file])
        redirect_to_index(@objects)
      end

      def reload; end

      def sort
        Language.sorter(params[:row])
      end

      private

      def index_variables
        @q = Language.ransack(params[:q])
        @languages = @q.result(distinct: true)
        @objects = @languages.page(@current_page).order(position: :desc)
        @total = @languages.size
        @attributes = Language.index_attributes
      end

      # Use callbacks to share common setup or constraints between actions.
      def set_language
        @language = Language.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def language_params
        params.require(:language).permit(:image, :name, :percentage, :color, :position, :deleted_at)
      end
    end
  end
end
