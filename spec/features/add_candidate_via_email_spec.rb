require 'spec_helper'

feature 'Owner emails a candidate to add@indorsely.com' do
  scenario 'it contains a pdf and shows up on the owners stream' do
    skip
    user  = build(:user)
    email = build(:email, :with_attachment)

    page.driver.post email_processor_path, email
    visit user_path(user)

    page.should have_content ''
  end
end
