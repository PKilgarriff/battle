feature 'show player scores' do 
  scenario 'shows player 1 score' do
    setup_2_players('John', 'Paul')
    expect(page).to have_content 'John - your score is 0'
    expect(page).to have_content 'Paul - your score is 0'
  end
end