feature 'Replying peeps' do

  before(:each) do
    sign_up
    peep
    click_button 'Sign Out'
  end

  scenario 'Users can reply to a peep' do
    sign_up_2
    visit('/peeps/newreply')
    fill_in :message, with: 'This is my response'
    click_button 'Post'
    expect(current_path).to eq '/'
    expect(page).to have_content "@j-dog"
    expect(page).to have_content 'This is my response'
    expect(page).to have_content bill.peeps.first.replys.first.peeps
  end
end
