require "application_system_test_case"

module KepplerCv
  class CertificatesTest < ApplicationSystemTestCase
    setup do
      @certificate = keppler_cv_certificates(:one)
    end

    test "visiting the index" do
      visit certificates_url
      assert_selector "h1", text: "Certificates"
    end

    test "creating a Certificate" do
      visit certificates_url
      click_on "New Certificate"

      fill_in "Deleted At", with: @certificate.deleted_at
      fill_in "Image", with: @certificate.image
      fill_in "Name", with: @certificate.name
      fill_in "Position", with: @certificate.position
      click_on "Create Certificate"

      assert_text "Certificate was successfully created"
      click_on "Back"
    end

    test "updating a Certificate" do
      visit certificates_url
      click_on "Edit", match: :first

      fill_in "Deleted At", with: @certificate.deleted_at
      fill_in "Image", with: @certificate.image
      fill_in "Name", with: @certificate.name
      fill_in "Position", with: @certificate.position
      click_on "Update Certificate"

      assert_text "Certificate was successfully updated"
      click_on "Back"
    end

    test "destroying a Certificate" do
      visit certificates_url
      page.accept_confirm do
        click_on "Destroy", match: :first
      end

      assert_text "Certificate was successfully destroyed"
    end
  end
end
