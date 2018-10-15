require "application_system_test_case"

module KepplerCv
  class ProjectsTest < ApplicationSystemTestCase
    setup do
      @project = keppler_cv_projects(:one)
    end

    test "visiting the index" do
      visit projects_url
      assert_selector "h1", text: "Projects"
    end

    test "creating a Project" do
      visit projects_url
      click_on "New Project"

      fill_in "Deleted At", with: @project.deleted_at
      fill_in "Description", with: @project.description
      fill_in "Image", with: @project.image
      fill_in "Name", with: @project.name
      fill_in "Position", with: @project.position
      fill_in "Url", with: @project.url
      click_on "Create Project"

      assert_text "Project was successfully created"
      click_on "Back"
    end

    test "updating a Project" do
      visit projects_url
      click_on "Edit", match: :first

      fill_in "Deleted At", with: @project.deleted_at
      fill_in "Description", with: @project.description
      fill_in "Image", with: @project.image
      fill_in "Name", with: @project.name
      fill_in "Position", with: @project.position
      fill_in "Url", with: @project.url
      click_on "Update Project"

      assert_text "Project was successfully updated"
      click_on "Back"
    end

    test "destroying a Project" do
      visit projects_url
      page.accept_confirm do
        click_on "Destroy", match: :first
      end

      assert_text "Project was successfully destroyed"
    end
  end
end
