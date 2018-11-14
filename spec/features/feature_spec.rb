feature 'Testing infrastructure' do

  scenario 'Can allow players to enter their name and see their HP' do
    sign_in_and_play
    expect(page).to have_content 'Bob HP is 100 and James HP is 100'
  end
end
