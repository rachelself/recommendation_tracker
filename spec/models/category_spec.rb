RSpec.describe Category do
  context "validations" do
    it { should have_many :entries }
    it { should allow_value('Books').
      for(:name) }
    it { should ensure_length_of(:name).
      is_at_most(30).
      with_message("must be less than 30 characters") }
    it { should validate_presence_of :name }
    it { should validate_uniqueness_of(:name).
      with_message("already exists") }
  end

  context "validating format" do
    let!(:category){ Category.create(name: "12") }

    it "should have an appropriate error message" do
      expect(category.errors.full_messages_for(:name)
            ).to include("Name must include letters")
    end

    it "shouldn't save the new record" do
      expect(Category.count).to eq 0
    end
  end
end
