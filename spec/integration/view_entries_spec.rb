RSpec.describe "Viewing an entry", :integration do

  context "listed in the menu" do
    let!(:category1){ Category.create(name: "Books") }
    let!(:category2){ Category.create(name: "Movies") }
    let!(:friend1){ Friend.create(name: "Sally") }
    let!(:friend2){ Friend.create(name: "Jenny") }
    let!(:entry1){ Entry.create!(name: "My Neighbor Totoro", category: category2, note: "The best ever", friend: friend1) }
    let!(:entry2){ Entry.create!(name: "Finding Nemo", category: category2, note: "funny fish!", friend: friend2) }
    let(:output){ run_rectrack_with_input("2", "1") }

    it "should print out the details for an entry" do
      expected = "MY NEIGHBOR TOTORO\n"+
                 "==============\n"+
                 "NOTE:\n"+
                 "The best ever\n"+
                 "\n"+
                 "RECOMMENDED BY:\n"+
                 "Sally"
      expect(output).to include(expected)
    end

    it "should include the name of the entry" do
      expect(output).to include(entry1.name)
    end

    it "should include the friend who made the recommendation" do
      expect(output).to include(friend1.name)
    end

    it "shouldn't include the friend of another entry" do
      expect(output).not_to include(friend2.name)
    end
  end

  context "not listed in the menu" do
    let!(:category1){ Category.create(name: "Books") }
    let(:output){ run_rectrack_with_input("1", "4") }

    it "should print an error message" do
      expect(output).to include("Sorry, entry 4 doesn't exist. Please select from the menu above or ADD a new entry.")
    end
  end

end
