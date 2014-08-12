RSpec.describe Entry do
  context "validations" do
    it { should belong_to :category }
    it { should belong_to :friend }
    it { should allow_value('Captain Underpants').
      for(:name) }
    it { should ensure_length_of(:name).
      is_at_most(30).
      with_message("must be less than 30 characters") }
    it { should validate_presence_of :name }
    it { should validate_presence_of :category }
    it { should validate_presence_of :note }
    it { should validate_presence_of :friend }
    it { should validate_uniqueness_of(:name).
      with_message("already exists") }
  end

  context "validating format" do
    let!(:category){ Category.create(name: "Books") }
    let!(:entry){ Entry.create(name: "jjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj") }

    it "should have an appropriate error message" do
      expect(entry.errors.full_messages_for(:name)
            ).to include("Name must be less than 30 characters")
    end

    it "shouldn't save the new record" do
      expect(Entry.count).to eq 0
    end
  end
end
