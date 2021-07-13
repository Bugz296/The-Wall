require 'rails_helper'
feature "User registers" do
    before(:each) do 
      visit new_user_path
    end
    scenario "successfully and current path should be messages_path" do
        fill_in "username", with: "Jeffrey"
        click_button "Signin"
        expect(page).to have_current_path(messages_path)
    end
    scenario "successfully and page should contain 'Welcome, Jeffrey' " do
        fill_in "username", with: "Jeffrey"
        click_button "Signin"
        expect(page).to have_content "Welcome, Jeffrey"
    end
    scenario "unsuccessfully and current path should be new_user_path" do
        fill_in "username", with: "Jeff"
        click_button "Signin"
        expect(page).to have_current_path(new_user_path)
    end
    scenario "unsuccessfully when Username is blank" do
        fill_in "username", with: ""
        click_button "Signin"
        expect(page).to have_content "Username can't be blank"
    end
    scenario "unsuccessfully when Username is lessthan 5 characters" do
        fill_in "username", with: "Jeff"
        click_button "Signin"
        expect(page).to have_content "Username is too short (minimum is 5 characters)"
    end
    scenario "unsuccessfully when Username is already taken" do
        fill_in "username", with: "Jeffrey"
        click_button "Signin"
        visit new_user_path
        fill_in "username", with: "Jeffrey"
        click_button "Signin"
        expect(page).to have_content "Username has already been taken"
    end
end