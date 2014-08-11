RSpec.describe "RecTrack Main Menu" do
  context "Prints a menu" do
#     it "shows fancy hexagon art" do
#       actual = run_rectrack_with_input()
#       expected = %q{
# ___     ___     ___     ___     ___     ___     ___     ___
# ___/   \___/   \___/   \___/   \___/   \___/   \___/   \___/   \___
# /   \___/   \___/   \___/   \___/   \___/   \___/   \___/   \___/   \
# \___/   \___/   \___/   \___/   \___/   \___/   \___/   \___/   \___/
# /   \___/                                                   \___/   \
# \___/                                                           \___/
# /   \                                                           /   \
# \___/                                                           \___/
# /   \                                                           /   \
# \___/                          RECTRACK                         \___/
# /   \                 keep track of recommendations             /   \
# \___/                        from friends!                      \___/
# /   \                                                           /   \
# \___/                                                           \___/
# /   \                                                           /   \
# \___/                                                           \___/
# /   \___                                                     ___/   \
# \___/   \___     ___     ___     ___     ___     ___     ___/   \___/
# /   \___/   \___/   \___/   \___/   \___/   \___/   \___/   \___/   \
# \___/   \___/   \___/   \___/   \___/   \___/   \___/   \___/   \___/
# \___/   \___/   \___/   \___/   \___/   \___/   \___/   \___/
# }
#       expect(actual).to include(expected)
#     end

    context "when we type an incorrect command" do
      let(:output){ run_rectrack_with_input('blah') }

      it "prints an informative message" do
        expect(output).to include("I don't know the 'blah' command.")
      end
    end

    context "normal commands" do
      let(:actual){ run_rectrack_with_input() }

      it "should print the list of categories" do
        Category.create(name: "Books")
        Category.create(name: "Movies")
        Category.create(name: "Places to Visit")
        # actual = run_rectrack_with_input()
        expected = "1. Books\n" +
                   "2. Movies\n" +
                   "3. Places to Visit\n"
        expect(actual).to include(expected)
      end
    end

  end
end
