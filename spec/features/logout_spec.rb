require 'rails_helper'
feature "User logs out" do
    before(:each) do 
      visit messages_path
    end
    scenario "has a logout button" do
        expect(page).to have_selector("input[type='submit'][value='Logout']")
    end
    scenario "current path should equal to new_user_path after clicking logout button" do
        click_button 'Logout'
        expect(page).to have_current_path(new_user_path)
    end
end