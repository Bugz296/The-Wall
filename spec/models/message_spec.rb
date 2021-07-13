require 'rails_helper'

RSpec.describe Message, type: :model do
    context "With invalid attributes" do 
        it "should not save if message field is blank" do
            expect(build(:message, message: "", user: User.first)).to be_invalid
        end
        it "should not save if message is less than 10 characters" do
            expect(build(:message, message: "Lorem Ips", user: User.first)).to be_invalid
        end
        it "should not save if user is not provided" do
            expect(build(:message, message: "Lorem Ipsum")).to be_invalid
        end
    end
end