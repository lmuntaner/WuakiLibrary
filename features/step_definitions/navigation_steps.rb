Given /^I am on the initial page$/ do
  @user = User.create!(
    username: 'sheldon',
    email: 'sheldon@awesome.com',
    password: '1234',
    password_confirmation: '1234'
  )
  item = Item.create!(title: 'Trainspotting', category: 'Movie')
  second_item = Item.create!(title: 'Fight Club', category: 'Movie')
  visit root_path
  expect(page).to have_content('All The Movies')
end

Then /^I click on my library button$/ do
  click_on 'my-library'
  expect(page).to have_content('My Library')
end
