RSpec.describe "Adding categories", :integration do

  context "valid input" do
    let!(:output){ run_rectrack_with_input("ADD", "Books") }

    it "should add a record" do
      expect(Category.count).to eql 1
    end

    it "should save the record accurately" do
      expect(Category.last.name).to eql "Books"
    end

    it "should print a success message" do
      expect(output).to include("Books has been added to the list of categories")
    end
  end

  context "invalid input: length" do
    let(:long_string){ "blah" * 10 }
    let!(:output){ run_rectrack_with_input("ADD", long_string) }

    it "prints the error message for length" do
      expect(output).to include("must be less than 30 characters")
    end

    it "should NOT save the new record" do
      expect(Category.count).to eql 0
    end
  end

  context "invalid input: duplicate" do
    let(:original_category){ "Books" }
    let(:duplicate_category){ "Books" }
    let!(:output1){ run_rectrack_with_input("ADD", original_category) }
    let!(:output2){ run_rectrack_with_input("ADD", duplicate_category) }

    it "prints the error message for uniqueness" do
      expect(output2).to include("already exists")
    end
  end

end
