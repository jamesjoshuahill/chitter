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

Then(/^I should be logged in$/) do
  current_path = URI.parse(current_url).path
  expect(current_path).to eq path_to('the home page')
  with_scope('header') do
    expect(page).to have_content "Hi Jess, happy cheeping!"
    expect(page).not_to have_content "Sign up"
  end
end

Then /^there should be ([0-9]+) users?$/ do |count|
  expect(User.count).to eq count.to_i
end

When(/^I fill in the sign up form with passwords that don't match$/) do
  with_scope('#sign-up') do
    fill_in('name', :with => correct_name)
    fill_in('email',  :with => correct_email)
    fill_in('password', :with => correct_password)
    fill_in('password_confirmation', :with => 'wrong password')
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

Then(/^I should see an incomplete details message$/) do
  with_scope('#errors') do
    expect(page).to have_content('Please try again:')
    expect(page).to have_content('Please provide your name')
    expect(page).to have_content('Please provide your email address')
    expect(page).to have_content('Please choose a username')
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

When(/^I fill in the log in form with correct details$/) do
  with_scope('#log-in') do
    fill_in('email',  :with => correct_email)
    fill_in('password', :with => correct_password)
    click_button 'Log in'
  end
end

When(/^I fill in the log in form with the wrong password$/) do
  with_scope('#log-in') do
    fill_in('email',  :with => correct_email)
    fill_in('password', :with => 'wrong password')
    click_button 'Log in'
  end
end

Then(/^I should see an invalid login message$/) do
  with_scope('#errors') do
    expect(page).to have_content('Please try again:')
    expect(page).to have_content('The email or password you typed did not work')
  end
end

Given(/^I am logged in$/) do
  User.create(name: correct_name,
            email: correct_email,
            password: correct_password,
            password_confirmation: correct_password,
            username: correct_username)
  visit path_to('the log in page')
  with_scope('#log-in') do
    fill_in('email',  :with => correct_email)
    fill_in('password', :with => correct_password)
    click_button 'Log in'
  end
end

Then(/^I should be logged out$/) do
  current_path = URI.parse(current_url).path
  expect(current_path).to eq path_to('the home page')
  with_scope('header') do
    expect(page).to have_content "Sign up"
    expect(page).to have_content "Log in"
    expect(page).not_to have_content "Hi Jess, happy cheeping!"
    expect(page).not_to have_content "Log out"
  end
end

Then(/^I should see an already logged in message$/) do
  with_scope('.notice') do
    expect(page).to have_content "You are already logged in"
  end
end