feature 'battle page' do 
  scenario 'player 1 receives confirmation after attacking player 2' do
    setup_2_players('John', 'Paul')
    click_button('Attack')
    expect(page).to have_content 'John has attacked Paul'
  end

  scenario 'player 2 has their hit points reduced after an attack' do
    setup_2_players('John', 'Paul')
    click_button('Attack')
    expect(page).to have_content 'Paul HP: -10'
  end
end