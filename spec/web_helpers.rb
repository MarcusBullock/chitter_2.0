def sign_up(name: 'bob', username: 'bob_marley', email: 'bob@bob.com',
            password: 'password', password_confirmation: 'password')
  visit('/')
  fill_in :name, with: name
  fill_in :username, with: username
  fill_in :email, with: email
  fill_in :password, with: password
  fill_in :password_confirmation, with: password_confirmation
  click_button 'Sign up'
end

def sign_in(email: 'bob@bob.com', password: 'password')
  visit('/')
  fill_in :email, with: email
  fill_in :password, with: password
end
