feature 'show player scores' do 
  scenario 'shows player 1 score' do
    setup_2_players('John', 'Paul')
    expect(page).to have_content 'John HP: 0'
    expect(page).to have_content 'Paul HP: 0'
  end
end