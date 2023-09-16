require 'rails_helper'

RSpec.feature 'groups/index', type: :system do
  fixtures :users, :groups, :founds_drainers

  before do
    user = users(:one)
    sign_in user
  end

  it 'displays group details' do
    group = groups(:group_one)
    visit group_path(group)

    expect(page).to have_css("img[src='#{group.icon}']")
    expect(page).to have_content(group.name)
    expect(page).to have_content(group.founds_drainers.sum(:amount))

    group.founds_drainers.each do |drainer|
      expect(page).to have_content(drainer.name)
      expect(page).to have_content(drainer.amount)
    end
  end

  it 'displays link to create new founds drainer' do
    group = groups(:group_one)
    visit group_path(group)

    expect(page).to have_link('ADD NEW TRANSACTION', href: new_group_founds_drainer_path(group))
  end
end
