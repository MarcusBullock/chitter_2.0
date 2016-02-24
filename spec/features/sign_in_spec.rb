feature 'user sign in' do

  let(:user) do
    User.create(name: 'Marcus Bullock',
                user_name: 'Marcus',
                email: 'marcb@hotmail.com',
                password: 'password',
                password_confirmation: 'password')
  end

  scenario 'a registered user can sign in' do
    sign_in(email: user.email, password: user.password )
    expect(page).to have_content "Marcus's Chitter"
  end

  scenario 'correct email is needed' do
    sign_in(email: 'different@email.com', password: user.password)
    expect(page).to have_content 'The email or password was incorrect'
  end

  scenario 'correct password is needed' do
    sign_in(email:user.email, password: 'wrong')
    expect(page).to have_content 'The email or password was incorrect'
  end

  scenario 'when signed in users may not sign up' do
    sign_in
    expect(page).not_to have_button "Sign up"
  end

end
