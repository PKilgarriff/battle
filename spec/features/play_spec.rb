feature 'play view' do 
  scenario 'shows player hit points' do
    setup_2_players('John', 'Paul')
    expect(page).to have_content 'John HP: 0'
    expect(page).to have_content 'Paul HP: 0'
    Game.instance.reset_players
  end
end