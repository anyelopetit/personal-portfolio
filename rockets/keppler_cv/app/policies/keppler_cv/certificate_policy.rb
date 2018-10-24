module KepplerCv
  # Policy for Certificate model
  class CertificatePolicy < ControllerPolicy
    attr_reader :user, :objects
    def initialize(user, objects)
      @user = user
      @objects = objects
    end
  end
end
