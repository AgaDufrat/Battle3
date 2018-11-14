feature 'Testing infrastructure' do

  scenario 'Can allow players to enter their name and see their HP' do
    sign_in_and_play
    expect(page).to have_content 'Bob HP is 100 and James HP is 100'
  end

  scenario 'Can attack player 2' do
    sign_in_and_play
    click_button "Attack"
    expect(page).to have_content 'Bob attacked James'
  end
  scenario 'reduce Player 2 HP by 10' do
    sign_in_and_play
    click_button "Attack"
    click_button "Next move"
    expect(page).to have_content 'Bob HP is 100 and James HP is 90'
  end

end
