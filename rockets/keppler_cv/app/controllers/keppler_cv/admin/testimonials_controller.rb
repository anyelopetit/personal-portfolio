# frozen_string_literal: true

require_dependency "keppler_cv/application_controller"
module KepplerCv
  module Admin
    # TestimonialsController
    class TestimonialsController < ::Admin::AdminController
      layout 'keppler_cv/admin/layouts/application'
      before_action :set_testimonial, only: %i[show edit update destroy]
      before_action :index_variables
      include ObjectQuery

      # GET /testimonials
      def index
        respond_to_formats(@testimonials)
        redirect_to_index(@objects)
      end

      # GET /testimonials/1
      def show; end

      # GET /testimonials/new
      def new
        @testimonial = Testimonial.new
      end

      # GET /testimonials/1/edit
      def edit; end

      # POST /testimonials
      def create
        @testimonial = Testimonial.new(testimonial_params)

        if @testimonial.save
          redirect(@testimonial, params)
        else
          render :new
        end
      end

      # PATCH/PUT /testimonials/1
      def update
        if @testimonial.update(testimonial_params)
          redirect(@testimonial, params)
        else
          render :edit
        end
      end

      def clone
        @testimonial = Testimonial.clone_record params[:testimonial_id]
        @testimonial.save
        redirect_to_index(@objects)
      end

      # DELETE /testimonials/1
      def destroy
        @testimonial.destroy
        redirect_to_index(@objects)
      end

      def destroy_multiple
        Testimonial.destroy redefine_ids(params[:multiple_ids])
        redirect_to_index(@objects)
      end

      def upload
        Testimonial.upload(params[:file])
        redirect_to_index(@objects)
      end

      def reload; end

      def sort
        Testimonial.sorter(params[:row])
      end

      private

      def index_variables
        @q = Testimonial.ransack(params[:q])
        @testimonials = @q.result(distinct: true)
        @objects = @testimonials.page(@current_page).order(position: :desc)
        @total = @testimonials.size
        @attributes = Testimonial.index_attributes
      end

      # Use callbacks to share common setup or constraints between actions.
      def set_testimonial
        @testimonial = Testimonial.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def testimonial_params
        params.require(:testimonial).permit(
          :photo, :name, :charge, :testimonial, :position, :deleted_at
        )
      end
    end
  end
end
