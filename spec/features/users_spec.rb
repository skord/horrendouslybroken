require 'spec_helper'

feature 'signing up' do
  def sign_up
    visit new_user_registration_path
    fill_in :user_name, with: valid_attributes[:name]
    fill_in :user_email, with: valid_attributes[:email]
    fill_in :user_password, with: 'Welcome1'
    fill_in :user_password_confirmation, with: 'Welcome1'
    click_button 'Sign up'
  end

  let(:valid_attributes) { FactoryGirl.attributes_for(:user) }

  scenario 'via the web form' do
    sign_up
    current_path.should eq root_path
  end

  scenario 'viewing my details on the registration edit page' do
    sign_up
    visit edit_user_registration_path
    page.should have_content(valid_attributes[:name])
    page.should have_content(valid_attributes[:email])
  end

  scenario 'editing my details on the registration edit page' do
    sign_up
    visit edit_user_registration_path
    fill_in :user_name, with: 'New Name'
    fill_in :user_email, with: valid_attributes[:email]
    fill_in :user_password, with: 'Welcome2'
    fill_in :user_password_confirmation, with: 'Welcome2'
    fill_in :user_current_password, with: 'Welcome1'
    click_button 'Update'
    current_path.should eq root_path
  end

  scenario 'editing my details and entering non-matching passwords' do
    sign_up
    visit edit_user_registration_path
    fill_in :user_name, with: 'New Name'
    fill_in :user_email, with: valid_attributes[:email]
    fill_in :user_password, with: 'Welcome2'
    fill_in :user_password_confirmation, with: 'Welcome3'
    click_button 'Update'
    page.should have_content('we need your current password to confirm your changes')
  end

  scenario 'canceling my account' do
    sign_up
    visit edit_user_registration_path
    click_link 'Cancel my account'
    page.should have_content('Bye! Your account was successfully cancelled. We hope to see you again soon.')
  end
end
