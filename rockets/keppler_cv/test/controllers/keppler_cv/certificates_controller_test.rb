require 'test_helper'

module KepplerCv
  class CertificatesControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    setup do
      @certificate = keppler_cv_certificates(:one)
    end

    test "should get index" do
      get certificates_url
      assert_response :success
    end

    test "should get new" do
      get new_certificate_url
      assert_response :success
    end

    test "should create certificate" do
      assert_difference('Certificate.count') do
        post certificates_url, params: { certificate: { deleted_at: @certificate.deleted_at, image: @certificate.image, name: @certificate.name, position: @certificate.position } }
      end

      assert_redirected_to certificate_url(Certificate.last)
    end

    test "should show certificate" do
      get certificate_url(@certificate)
      assert_response :success
    end

    test "should get edit" do
      get edit_certificate_url(@certificate)
      assert_response :success
    end

    test "should update certificate" do
      patch certificate_url(@certificate), params: { certificate: { deleted_at: @certificate.deleted_at, image: @certificate.image, name: @certificate.name, position: @certificate.position } }
      assert_redirected_to certificate_url(@certificate)
    end

    test "should destroy certificate" do
      assert_difference('Certificate.count', -1) do
        delete certificate_url(@certificate)
      end

      assert_redirected_to certificates_url
    end
  end
end
