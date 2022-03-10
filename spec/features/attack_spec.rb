feature 'battle page' do 
  scenario 'attacking player 2 gives confirnation and reduces HP' do
    setup_2_players('John', 'Paul')
    click_button('Attack')
    expect(page).to have_content 'John has attacked Paul'
    expect(page).to have_content 'Paul HP: -10'
    Game.instance.reset_players
  end

  scenario 'attacking twice reduces both players hit_points' do
    setup_2_players('John', 'Paul')
    click_button('Attack')
    click_button('Attack')
    expect(page).to have_content 'Paul HP: -10'
    expect(page).to have_content 'John HP: -10'
    Game.instance.reset_players
  end
end
