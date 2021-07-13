require 'rails_helper'

RSpec.describe User, type: :model do
    context "With invalid attributes" do 
        it "should not save if first_name field is blank" do
            expect(build(:user, username: "")).to be_invalid
        end
        it "should not save if first_name is already taken" do
            create(:user, username: "jeffrey")
            expect(build(:user, username: "Jeffrey")).to be_invalid
        end
        it "should not save if first_name is less than 5 characters" do
            expect(build(:user, username: "Jeff")).to be_invalid
        end
    end
end