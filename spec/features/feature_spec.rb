feature 'Testing infrastructure' do

  scenario 'Can allow players to enter their name and see their HP' do
    visit('/')
    fill_in 'player_1', with: 'Bob'
    fill_in 'player_2', with: 'James'
    click_button "Submit"
    expect(page).to have_content 'Bob HP is 100 and James HP is 100'
  end
end
