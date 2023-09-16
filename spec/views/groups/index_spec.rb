require 'rails_helper'

RSpec.feature "groups/index", type: :system do
  fixtures :users

  before do
    user = users(:one)
    sign_in user
  end

  it 'displays all groups belonging to the user' do
    visit groups_path
    user_groups = Group.where(user: users(:one))
    user_groups.each do |group|
      expect(page).to have_link(group.name, href: group_path(group))
      expect(page).to have_content(group.name)
      expect(page).to have_css("img[src='#{group.icon}']")
    end
  end

  it 'displays link to create new group' do
    visit groups_path
    expect(page).to have_link('ADD NEW CATEGORY', href: new_group_path)
  end
end
