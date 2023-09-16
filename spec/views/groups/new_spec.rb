require 'rails_helper'

RSpec.feature "groups/new", type: :system do
  fixtures :users, :groups, :founds_drainers

  before do
    user = users(:one)
    sign_in user
  end

  it "allows a user to create a new group" do
    visit new_group_path

    fill_in "Name", with: "Test Group"
    fill_in "Image Url", with: "https://example.com/test-image.png"

    click_on "SAVE"

    expect(page).to have_content("Test Group")
  end

  it "displays validation errors for an invalid group" do
    visit new_group_path

    # Do not fill in the required fields intentionally.

    click_on "SAVE"

    expect(page).to have_current_path(new_group_path)
  end
end
