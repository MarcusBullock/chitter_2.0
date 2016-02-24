feature 'viewing a peep' do
  scenario 'peeps should display user and user_name' do
    sign_up
    peep
    within 'ul#peeps' do
      expect(page).to have_content 'Marcus (marc_b) peeped: This is a test'
    end
  end

  scenario 'peeps should appear in reverse order do' do
    sign_up
    Timecop.freeze do
    3.times do |peep|
      click_button "Compose a peep!"
      fill_in :peep, with: "#{peep + 1}"
      click_button 'Peep!'
    end
    within 'ul#peeps' do
      expect(page).to have_content "Marcus (marc_b) peeped: 3 #{Time.now.strftime('%H:%M, %e %B %Y')}
      Marcus (marc_b) peeped: 2 #{Time.now.strftime('%H:%M, %e %B %Y')}
      Marcus (marc_b) peeped: 1 #{Time.now.strftime('%H:%M, %e %B %Y')}"
    end
    end
  end

  scenario 'peeps should display time of creation' do
    sign_up
    Timecop.freeze do
      peep
      within 'ul#peeps' do
        expect(page).to have_content "#{Time.now.strftime('%H:%M, %e %B %Y')}"
      end
    end
  end
end
