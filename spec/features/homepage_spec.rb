feature 'serve web app' do 
  scenario 'two players can set their names' do
    visit('/')
    expect(page).to have_field('Player 1')
    expect(page).to have_field('Player 2')
    expect(page).to have_button('Submit')
    fill_in 'Player 1', with: 'Jonny'
    fill_in 'Player 2', with: 'Paul'
    click_on 'Submit'
    expect(page).to have_content 'Welcome Jonny and Paul!'
  end
end