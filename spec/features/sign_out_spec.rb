feature 'user sign out' do

  let(:user) do
    User.create(name: 'Marcus Bullock',
                user_name: 'Marcus',
                email: 'marcb@hotmail.com',
                password: 'password',
                password_confirmation: 'password')
  end

  scenario 'users may sign out' do
    sign_in(email: user.email, password: user.password)
    click_button 'Sign Out'
    expect(page).to have_content 'Goodbye'
    expect(page).to have_content 'Welcome to Chitter'
  end
end
