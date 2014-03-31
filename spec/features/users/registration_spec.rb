require 'spec_helper'

describe "Signing up" do
    it "allows a user to sign up for the sight and creates the object in the database" do
       expect(User.count).to eq(0)
        
        visit "/"
        expect(page).to have_content("Sign Up")
        click_link "Sign Up"
        
        fill_in "First Name", with: "Kevin"
        fill_in "Last Name", with: "Staiger"
        fill_in "Email", with: "kstag07@yahoo.com"
        fill_in "Password", with: "hello1234"
        fill_in "Password (again)", with: "hello1234"
        click_button "Sign Up"
        
        expect(User.count).to eq(1)
    
    end 
end
    