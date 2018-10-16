module KepplerCv
  # Policy for Testimonial model
  class TestimonialPolicy < ControllerPolicy
    attr_reader :user, :objects
    def initialize(user, objects)
      @user = user
      @objects = objects
    end
  end
end
