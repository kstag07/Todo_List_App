require 'spec_helper'

describe User do
    let(:valid_attributes) {
        {
            first_name: "Kevin",
            last_name: "Staiger",
            email: "kstag07@yahoo.com",
            password: "hello1234",
            password_confirmation: "hello1234"
            }
        }
        
  context "validations" do
      let(:user) { User.new(valid_attributes)}
      
      before do        User.create(valid_attributes)
          end
      
      it "requires the user to have an email" do
        expect(user).to validate_presence_of(:email)  
          end
      it "requires a unique email" do
     expect(user).to validate_uniqueness_of(:email)     
          end
      it  "requires a unique email (case insensitive)" do
          user.email = "KSTAG07@YAHOO.COM"
          expect(user).to validate_uniqueness_of(:email)
          end
      
      it " requires the email address to look like a email" do
          user.email = "kevin"
          expect(user).to_not be_valid
          end
     
    
    describe "#downcase_email" do
        it "make the email attribute lowercase" do
            user = User.new(valid_attributes.merge(email: "KSTAG07@YAHOO.COM"))
            
            expect{user.downcase_email }.to change{user.email}.from("KSTAG07@YAHOO.COM").to("kstag07@yahoo.com")
            end
        end
      
      it "downcases an email before saving" do  
          user = User.new(valid_attributes)
          user.email = "KEVIN@GMAIL.COM"
          expect(user.save).to be_true
          expect(user.email).to  eq("kevin@gmail.com")
          end
        end
end
