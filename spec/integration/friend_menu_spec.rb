RSpec.describe "Viewing the friend menu", :integration do
  let!(:category){ Category.create(name: "Restaurants") }

  context "with many friends" do
    let!(:friend1){ Friend.create(name: "Trevor") }
    let!(:friend2){ Friend.create(name: "Mason") }
    let!(:friend3){ Friend.create(name: "Joe") }
    let!(:entry){ Entry.create(name: "Fido", category: category, note: "Get the specials", friend: friend2) }
    let(:output){ run_rectrack_with_input("1", "FILTER") }

    it "should print a list with 3 friends" do
      expected = "=============="
                 "What friend would you like to filter by?"
                 "=============="
                 "1. Trevor\n" +
                 "2. Mason\n" +
                 "3. Joe\n"
      expect(output).to include(expected)
    end

    it "should have printed all the friends in the db" do
      expect(Friend.count).to eq(3)
    end
  end
end
