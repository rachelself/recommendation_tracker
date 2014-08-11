RSpec.describe "Viewing the entry menu", :integration do
  let!(:category1){ Category.create(name: "Restaurants") }
  let!(:category2){ Category.create(name: "Music") }
  # let!(:category3){ Category.create(name: "TV Shows") }

  context "a category that is in the list" do
    let(:output){ run_rectrack_with_input('2') } #Music

    before do
      Entry.create(name: "Snowmine", category: category2)
      Entry.create(name: "Antrim Dells", category: category2)
      Entry.create(name: "Epice", category: category1)
      Entry.create(name: "The Smiling Elephant", category: category1)
    end

    it "should include the name of the category being viewed" do
      expect(output).to include("Looking up recommendations for Music...")
    end

    it "should list the entries in this category" do
      expected = "1. Snowmine\n" +
                 "2. Antrim Dells\n"
      expect(output).to include(expected)
    end

    it "shouldn't list the entries in other categories" do
      expect(output).not_to include("Epice")
      expect(output).not_to include("The Smiling Elephant")
    end

    # it "should print a message for a category with no entries" do
    #   expect(output3).to include("You have no entries for this category.")
    # end
  end

  context "a category that doesn't exist" do
    let(:output){ run_rectrack_with_input('5') }

    it "prints an error message" do
      expect(output).to include("Sorry, category 5 doesn't exist.")
    end
  end
end
