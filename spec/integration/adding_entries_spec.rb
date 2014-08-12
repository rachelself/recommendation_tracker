RSpec.describe "Adding entries to a category", :integration do

  context "valid input" do
    # pending
    let!(:category1){ Category.create(name: "Movies") }
    let!(:category2){ Category.create(name: "Foods") }
    let!(:friend1){ Friend.create(name: "MaRisa Jackson") }
    let!(:friend2){ Friend.create(name: "Trevor Richardson") }
    let!(:output){ run_rectrack_with_input("1", "ADD", "Boyhood", "Belle said this movie filmed a real kid's life over the span of 12 years!", "1")}


    it "prints a success message" do
      expect(output).to include ("Boyhood has been added to the Movie category")
    end

    it "saves the correct category to the record" do
      expect(Entry.last.category_id).to eq category1.id
    end

    it "saves the entry name" do
      expect(Entry.last.name).to eq "Boyhood"
    end

    it "saves the entry note" do
      expect(Entry.last.note).to include "Belle said this movie filmed a real kid's life over the span of 12 years!"
    end

    it "saves the entry friend" do
      expect(Entry.last.friend.name).to eq friend1.name
    end
  end

  context "invalid input: Name" do
    let!(:category){ Category.create(name: "Books") }
    let(:output){ run_rectrack_with_input("1", "ADD", "") }

    it "prints an error message" do
      expect(output).to include("Name can't be blank")
    end

    it "doesn't create an entry" do
      expect(Entry.count).to eq 0
    end
  end

  context "invalid input: Note" do
    let!(:category){ Category.create(name: "Restaurants") }
    let(:output){ run_rectrack_with_input("1", "ADD", "Epice", "") }

    it "prints an error message" do
      expect(output).to include("Note can't be blank")
    end

    it "doesn't create an entry" do
      expect(Entry.count).to eq 0
    end
  end

  context "invalid input: Friend" do
    let!(:category){ Category.create(name: "Restaurants") }
    let(:output){ run_rectrack_with_input("1", "ADD", "A Tale of Two Cities", "8th grade awesome I missed out on", "") }

    it "prints an error message" do
      expect(output).to include("Friend can't be blank")
    end

    it "doesn't create an entry" do
      expect(Entry.count).to eq 0
    end
  end
end
