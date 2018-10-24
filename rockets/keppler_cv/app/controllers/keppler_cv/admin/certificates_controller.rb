# frozen_string_literal: true

require_dependency "keppler_cv/application_controller"
module KepplerCv
  module Admin
    # CertificatesController
    class CertificatesController < ::Admin::AdminController
      layout 'keppler_cv/admin/layouts/application'
      before_action :set_certificate, only: %i[show edit update destroy]
      before_action :index_variables
      include ObjectQuery

      # GET /certificates
      def index
        respond_to_formats(@certificates)
        redirect_to_index(@objects)
      end

      # GET /certificates/1
      def show; end

      # GET /certificates/new
      def new
        @certificate = Certificate.new
      end

      # GET /certificates/1/edit
      def edit; end

      # POST /certificates
      def create
        @certificate = Certificate.new(certificate_params)

        if @certificate.save
          redirect(@certificate, params)
        else
          render :new
        end
      end

      # PATCH/PUT /certificates/1
      def update
        if @certificate.update(certificate_params)
          redirect(@certificate, params)
        else
          render :edit
        end
      end

      def clone
        @certificate = Certificate.clone_record params[:certificate_id]
        @certificate.save
        redirect_to_index(@objects)
      end

      # DELETE /certificates/1
      def destroy
        @certificate.destroy
        redirect_to_index(@objects)
      end

      def destroy_multiple
        Certificate.destroy redefine_ids(params[:multiple_ids])
        redirect_to_index(@objects)
      end

      def upload
        Certificate.upload(params[:file])
        redirect_to_index(@objects)
      end

      def reload; end

      def sort
        Certificate.sorter(params[:row])
      end

      private

      def index_variables
        @q = Certificate.ransack(params[:q])
        @certificates = @q.result(distinct: true)
        @objects = @certificates.page(@current_page).order(position: :desc)
        @total = @certificates.size
        @attributes = Certificate.index_attributes
      end

      # Use callbacks to share common setup or constraints between actions.
      def set_certificate
        @certificate = Certificate.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def certificate_params
        params.require(:certificate).permit(
          :image, :name, :position, :deleted_at
        )
      end
    end
  end
end
