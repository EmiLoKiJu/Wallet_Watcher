RSpec.feature 'founds_drainers/new', type: :system do
  fixtures :users, :groups, :founds_drainers

  before do
    user = users(:one)
    sign_in user
  end

  it 'allows creating a new founds drainer' do
    group = groups(:group_one)
    visit new_group_founds_drainer_path(group)

    fill_in 'Name', with: 'New Found Drainer'
    fill_in 'Amount', with: 100.0

    check "group_#{groups(:group_one).id}"
    check "group_#{groups(:group_two).id}"

    click_button 'SAVE'

    expect(page).to have_content('Found drainer was successfully created.')
    expect(page).to have_content('New Found Drainer')
    expect(page).to have_content('100.0')
    expect(page).to have_content(groups(:group_one).name)
  end

  it 'displays validation errors for incomplete form' do
    group = groups(:group_one)
    visit new_group_founds_drainer_path(group)

    click_button 'SAVE'

    expect(page).to have_current_path(new_group_founds_drainer_path(group))
  end
end
