require "application_system_test_case"

class BuyfeedbacksTest < ApplicationSystemTestCase
  setup do
    @buyfeedback = buyfeedbacks(:one)
  end

  test "visiting the index" do
    visit buyfeedbacks_url
    assert_selector "h1", text: "Buyfeedbacks"
  end

  test "creating a Buyfeedback" do
    visit buyfeedbacks_url
    click_on "New Buyfeedback"

    click_on "Create Buyfeedback"

    assert_text "Buyfeedback was successfully created"
    click_on "Back"
  end

  test "updating a Buyfeedback" do
    visit buyfeedbacks_url
    click_on "Edit", match: :first

    click_on "Update Buyfeedback"

    assert_text "Buyfeedback was successfully updated"
    click_on "Back"
  end

  test "destroying a Buyfeedback" do
    visit buyfeedbacks_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Buyfeedback was successfully destroyed"
  end
end
