require "application_system_test_case"

class ExpertsTest < ApplicationSystemTestCase
  setup do
    @expert = experts(:one)
  end

  test "visiting the index" do
    visit experts_url
    assert_selector "h1", text: "Experts"
  end

  test "creating a Expert" do
    visit experts_url
    click_on "New Expert"

    fill_in "Name", with: @expert.name
    fill_in "Personal website url", with: @expert.personal_website_url
    fill_in "Shortend url", with: @expert.shortend_url
    click_on "Create Expert"

    assert_text "Expert was successfully created"
    click_on "Back"
  end

  test "updating a Expert" do
    visit experts_url
    click_on "Edit", match: :first

    fill_in "Name", with: @expert.name
    fill_in "Personal website url", with: @expert.personal_website_url
    fill_in "Shortend url", with: @expert.shortend_url
    click_on "Update Expert"

    assert_text "Expert was successfully updated"
    click_on "Back"
  end

  test "destroying a Expert" do
    visit experts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Expert was successfully destroyed"
  end
end
