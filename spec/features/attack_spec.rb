feature 'battle page' do 
  scenario 'player 1 receives confirmation after attacking player 2' do
    setup_2_players('John', 'Paul')
    click_button('Attack')
    expect(page).to have_content 'Player 1 has attacked Player 2'
  end
end