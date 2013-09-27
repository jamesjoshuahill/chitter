correct_name = 'Jess'
correct_email = 'jess@puppy.com'
correct_password = 'woof'
correct_username = 'jess'

When(/^I fill in the sign up form with correct details$/) do
  with_scope('#sign-up') do
    fill_in('name', :with => correct_name)
    fill_in('email',  :with => correct_email)
    fill_in('password', :with => correct_password)
    fill_in('password_confirmation', :with => correct_password)
    fill_in('username', :with => correct_username)
    click_button 'Sign up'
  end
end

Then(/^I should see my welcome message$/) do
  expect(page).to have_content "Hi Jess, happy cheeping!"
end

Then /^there should be ([0-9]+) users?$/ do |count|
  expect(User.count).to eq count.to_i
end

When(/^I fill in the sign up form with passwords that don't match$/) do
  with_scope('#sign-up') do
    fill_in('name', :with => correct_name)
    fill_in('email',  :with => correct_email)
    fill_in('password', :with => correct_password)
    fill_in('password_confirmation', :with => 'foow')
    fill_in('username', :with => correct_username)
    click_button 'Sign up'
  end
end

Then(/^I should see a passwords don't match message$/) do
  with_scope('#errors') do
    expect(page).to have_content('Please try again:')
    expect(page).to have_content('The passwords you typed did not match')
  end
end

Given(/^I have signed up$/) do
  User.create(name: correct_name,
              email: correct_email,
              password: correct_password,
              password_confirmation: correct_password,
              username: correct_username)
end

Then(/^I should see an invalid sign up message$/) do
  with_scope('#errors') do
    expect(page).to have_content('Please try again:')
    expect(page).to have_content('There is already an account with this email address')
    expect(page).to have_content('There is already an account with this username')
  end
end