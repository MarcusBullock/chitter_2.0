module SessionHelpers

  def sign_up(name: 'Marcus',
              user_name: 'marc_b',
              email: 'marcb@hotmail.com',
              password: 'password',
              password_confirmation: 'password')

    visit '/'
    click_button 'Sign Up'
    fill_in :name, with: name
    fill_in :user_name, with: user_name
    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button 'Submit'
  end

  def sign_up_2(name: 'John',
              user_name: 'j-dog',
              email: 'john@hotmail.com',
              password: 'password',
              password_confirmation: 'password')

    visit '/'
    click_button 'Sign Up'
    fill_in :name, with: name
    fill_in :user_name, with: user_name
    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button 'Submit'
  end

  def sign_in(email: 'marcb@hotmail.com',
              password: 'password')
    visit '/sessions/new'
    fill_in :email, with: email
    fill_in :password, with: password
    click_button 'Sign in'
  end

  def sign_in_2(email: 'john@hotmail.com',
              password: 'password')
    visit '/sessions/new'
    fill_in :email, with: email
    fill_in :password, with: password
    click_button 'Sign in'
  end

  def peep
    click_button 'Compose a peep!'
    fill_in :peep, with: 'This is a test'
    click_button 'Peep!'
  end

  def peep_2
    click_button 'Compose a peep!'
    fill_in :peep, with: 'This is a reply'
    click_button 'Peep!'
  end


end
