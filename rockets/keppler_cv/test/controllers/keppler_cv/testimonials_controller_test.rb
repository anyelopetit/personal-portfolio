require 'test_helper'

module KepplerCv
  class TestimonialsControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    setup do
      @testimonial = keppler_cv_testimonials(:one)
    end

    test "should get index" do
      get testimonials_url
      assert_response :success
    end

    test "should get new" do
      get new_testimonial_url
      assert_response :success
    end

    test "should create testimonial" do
      assert_difference('Testimonial.count') do
        post testimonials_url, params: { testimonial: { charge: @testimonial.charge, deleted_at: @testimonial.deleted_at, name: @testimonial.name, photo: @testimonial.photo, position: @testimonial.position, testimonial: @testimonial.testimonial } }
      end

      assert_redirected_to testimonial_url(Testimonial.last)
    end

    test "should show testimonial" do
      get testimonial_url(@testimonial)
      assert_response :success
    end

    test "should get edit" do
      get edit_testimonial_url(@testimonial)
      assert_response :success
    end

    test "should update testimonial" do
      patch testimonial_url(@testimonial), params: { testimonial: { charge: @testimonial.charge, deleted_at: @testimonial.deleted_at, name: @testimonial.name, photo: @testimonial.photo, position: @testimonial.position, testimonial: @testimonial.testimonial } }
      assert_redirected_to testimonial_url(@testimonial)
    end

    test "should destroy testimonial" do
      assert_difference('Testimonial.count', -1) do
        delete testimonial_url(@testimonial)
      end

      assert_redirected_to testimonials_url
    end
  end
end
