cheep_tastic_message = 'Chitter is cheep-tastic!'

When(/^I fill out the new cheep form with a cheep\-tastic message$/) do
  with_scope('#new-cheep') do
    fill_in('message', :with => cheep_tastic_message)
    click_button 'Add cheep!'
  end
end

Then(/^I should see my cheep\-tastic cheep$/) do
  with_scope('#cheeps') do
    expect(page).to have_content('Jess')
    expect(page).to have_content(cheep_tastic_message)
  end
end