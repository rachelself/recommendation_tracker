RSpec.describe "Filtering entries by friend", :integration do

  context "valid input" do
    let!(:category1){ Category.create(name: "Books") }
    let!(:category2){ Category.create(name: "Movies") }
    let!(:friend1){ Friend.create(name: "MaRisa Jackson") }
    let!(:entry1){ Entry.create(name:"Holes", category: category1, note: "Not Shia Labouf", friend: friend1) }
    let!(:entry2){ Entry.create(name:"The Girl's Guide", category: category1, note: "jabba da hut", friend: friend1) }
    let!(:entry3){ Entry.create(name:"Fire Cat", category: category1, note: "from her childhood", friend: friend1) }
    let!(:entry4){ Entry.create(name:"Black Fish", category: category2, note: "Not Shia Labouf", friend: friend1) }
    let(:output){ run_rectrack_with_input("1", "FILTER", "1") }

    it "prints a success message" do
      expect(output).to include("3 entries found for MaRisa Jackson in the Book category!")
    end

    it "prints the entries found" do
      expected = "=============="
                 "BOOK RECOMMENDATIONS BY MARISA"
                 "=============="
                 "1. Holes\n" +
                 "2. The Girl's Guide to Homelessness\n" +
                 "3. Fire Cat\n"
      expect(output).to include(expected)
    end

    it "includes entries under the current category" do
      expect(output).to include(entry1.name)
      expect(output).to include(entry2.name)
      expect(output).to include(entry3.name)
    end

    it "should NOT include entries under other categories" do
      expect(output).not_to include(entry4.name)
    end
  end

  context "valid input but no entries" do
    let!(:category1){ Category.create(name: "Restaurants") }
    let!(:category2){ Category.create(name: "TV Shows") }
    let!(:friend){ Friend.create(name: "Brian") }
    let!(:entry){ Entry.create(name:"Person of Interest", category: category2, note: "conspiracies", friend: friend) }
    let(:output){ run_rectrack_with_input("1", "FILTER", "1") }


    it "prints out a no_entries_found message" do
      expect(output).to include("Your friend Brian hasn't made any recommendations in the Restaurant category.")
    end
  end

  context "invalid input" do
    let!(:category){ Category.create(name: "Movies") }
    let!(:friend){ Friend.create(name: "Mason") }
    let!(:entry){ Entry.create(name:"WALL-E", category: category, note: "the only movie he will watch", friend: friend) }
    let(:output){ run_rectrack_with_input("1", "FILTER", "2") }

    it "prints an error message" do
      expect(output).to include("Sorry, friend 2 doesn't exist. Please choose a friend off existing menu.")
    end

    it "should not print out the find_friend_by_id error" do
      expect(output).not_to include("No friend found by that ID. Please re-type or ADD to create new.")
    end
  end

end
