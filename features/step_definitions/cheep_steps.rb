cheep_tastic_message = 'Chitter is cheep-tastic!'

When(/^I fill out the new cheep form with a cheep\-tastic message$/) do
  with_scope('#new-cheep') do
    fill_in('message', :with => cheep_tastic_message)
    click_button 'Add cheep!'
  end
end

Then(/^I should see my cheep\-tastic cheep$/) do
  with_scope('.notice') do
    expect(page).to have_content('You cheeped!')
  end
  with_scope('#cheeps') do
    expect(page).to have_content('Jess')
    expect(page).to have_content(cheep_tastic_message)
  end
end

correct_name = 'Jess'
correct_email = 'jess@puppy.com'
correct_password = 'woof'
correct_username = 'jess'

Given(/^there are a few cheeps$/) do
  user = User.create(name: correct_name,
            email: correct_email,
            password: correct_password,
            password_confirmation: correct_password,
            username: correct_username)
  Cheep.create(message: "#{cheep_tastic_message} - first", user: user)
  Cheep.create(message: "#{cheep_tastic_message} - second", user: user)
  Cheep.create(message: "#{cheep_tastic_message} - third", user: user)
end

Then(/^I should see the few cheeps in chronological order$/) do
  expect(page.body).to match(/(third)(.*)(second)(.*)(first)/m) 
end