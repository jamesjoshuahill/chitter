When(/^I fill in the sign up form with my details$/) do
  with_scope('#sign-up') do
    fill_in('name', :with => 'Jess')
    fill_in('email',  :with => 'jess@puppy.com')
    fill_in('password', :with => 'woof')
    fill_in('username', :with => 'username')
    click_button 'Sign up'
  end
end

Then(/^I should see my welcome message$/) do
  expect(page).to have_content "Hi Jess, happy cheeping!"
end

Then /^I should have ([0-9]+) user$/ do |count|
  expect(User.count).to eq count.to_i
end