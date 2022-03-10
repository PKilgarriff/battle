feature 'serve web app' do 
  scenario 'two players can set their names' do
    setup_2_players('John', 'Paul')
    expect(page).to have_content 'Welcome John and Paul!'
  end
end