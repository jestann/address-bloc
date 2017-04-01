require_relative '../models/entry'

# standard first line
# this is a spec file and it tests Entry
RSpec.describe Entry do
    # describe gives this test structure
    # it tests the Entry attibutes
    describe "attributes" do
        
        let (:entry) { Entry.new('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')}
        # each 'it' is a unique test
        it "responds to name" do
            entry = Entry.new('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
            # to make sure always has values
            expect(entry).to respond_to(:name)
            # end with one or more expect methods
            # these declare the expectations for the test
            # if they are met = pass
            # this checks if entry.name is valid
        end
        
        it "reports its name" do
            expect(entry.name).to eq('Ada Lovelace')
        end
        
        it "responds to phone number" do
            expect(entry).to respond_to(:phone_number)
        end
    
        it "reports its phone_number" do
            expect(entry.phone_number).to eq('010.012.1815')
        end
        
        it "responds to email" do
            expect(entry).to respond_to(:email)
        end
    
        it "reports its email" do
            expect(entry.email).to eq('augusta.king@lovelace.com')
        end
    end
    
    # separate this to_s test from the initializer tests
    describe "#to_s" do
        it "prints an entry as a string" do
            entry = Entry.new('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
            expected_string = "Name: Ada Lovelace\nPhone Number: 010.012.1815\nEmail: augusta.king@lovelace.com"
            expect(entry.to_s).to eq(expected_string)
        end
    end
end