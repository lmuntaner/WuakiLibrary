Given /^I am on the initial page$/ do
  @user = User.create!(
    username: 'sheldon',
    email: 'sheldon@awesome.com',
    password: '1234',
    password_confirmation: '1234'
  )
  @item = Item.create!(title: 'Trainspotting', category: 'Movie')
  @purchase_option = @item.purchase_options.create!(quality: 'HD', price: 2.99)
  visit root_path
  expect(page).to have_content('All The Movies')
end

Then /^I click on the "([^\"]*)" movie$/ do |movie_title|
  click_link movie_title
  expect(page).to have_content(@item.title)
end

Then /^I buy the "([^\"]*)" choice$/ do |quality_choice|
  click_button quality_choice
  expect(page).to have_content('My Library')
end
