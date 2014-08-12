RSpec.describe Friend do
  context "validations" do
    it { should have_many :entries }
    it { should allow_value('Janet').
      for(:name) }
    it { should ensure_length_of(:name).
      is_at_most(30).
      with_message("must be less than 30 characters") }
    it { should validate_presence_of :name }
    it { should validate_uniqueness_of(:name).
      with_message("already exists") }
  end

  context "validating format - length" do
    let!(:friend){ Friend.create(name: "jjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj")}

    it "should have an appropriate error message" do
      expect(friend.errors.full_messages_for(:name)
            ).to include("Name must be less than 30 characters")
    end

    it "shouldn't save the new record" do
      expect(Friend.count).to eq 0
    end
  end

  context "validating format - letters" do
    let!(:friend){ Friend.create(name: "12")}

    it "should have an appropriate error message" do
      expect(friend.errors.full_messages_for(:name)
            ).to include("Name must include letters")
    end

    it "shouldn't save the new record" do
      expect(Friend.count).to eq 0
    end

  end
end
