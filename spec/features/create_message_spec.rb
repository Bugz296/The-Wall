require 'rails_helper'
feature "User creates a message" do
    before(:each) do 
      visit messages_path
    end
    scenario "successfully and current path should be messages_path" do
        fill_in "msg_message", with: "Lorem Ipsum"
        click_button "Post-a-Message"
        expect(page).to have_current_path(messages_path)
    end
    scenario "successfully and current page should contain message just created" do
        visit new_user_path
        fill_in "username", with: "Jeffrey"
        click_button "Signin"
        fill_in "msg_message", with: "Lorem Ipsum"
        click_button "Post-a-Message"
        expect(page).to have_content "Lorem Ipsum"
    end

    scenario "unsuccessfully and current path should be messages_path" do
        fill_in "msg_message", with: ""
        click_button "Post-a-Message"
        expect(page).to have_current_path(messages_path)
    end
    scenario "unsuccessfully if message field is blank" do
        fill_in "msg_message", with: ""
        click_button "Post-a-Message"
        expect(page).to have_content "Message can't be blank"
    end
    scenario "unsuccessfully if message is less than 10 characters" do
        fill_in "msg_message", with: "Lorem"
        click_button "Post-a-Message"
        expect(page).to have_content "Message is too short (minimum is 10 characters)"
    end
end