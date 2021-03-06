describe SendRecoverLink do

  let(:user) { double :user, email: 'marcb@hotmail.com', password_token: '12345678' }
  let(:mail_gun_client) { double :mail_gun_client }
  let(:sandbox_domain_name) { ENV['MG_DOMAIN_NAME'] }

  it 'sends a message to mailgun when called' do
    params = {from: 'postmaster@mail.chithole.com',
              to: user.email,
              subject: 'Reset your password',
              text: "Click here to reset password: http://chithole.herokuapp.com/reset_password?token=#{user.password_token}"}
    expect(mail_gun_client).to receive(:send_message).with(sandbox_domain_name, params)
    described_class.call(user, mail_gun_client)
  end
end
