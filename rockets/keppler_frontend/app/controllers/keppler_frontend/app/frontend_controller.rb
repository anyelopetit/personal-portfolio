require_dependency "keppler_frontend/application_controller"

module KepplerFrontend
  class App::FrontendController < App::AppController
    # End callbacks area (don't delete)
    include FrontsHelper
    layout 'layouts/keppler_frontend/app/layouts/application'
    # begin index
    def index
      @languages = rocket('cv', 'languages').all
      @projects = rocket('cv', 'projects').order(created_at: :desc).first(6)
      @message = rocket('contact_us', 'messages').new
      @testimonials = rocket('cv', 'testimonials').all
    end
    # end index

    # begin keppler
    def keppler
    end
    # end keppler

    private
    # begin callback user_authenticate
    def user_authenticate
      redirect_to '/' unless user_signed_in?
    end
    # end callback user_authenticate
  end
end
