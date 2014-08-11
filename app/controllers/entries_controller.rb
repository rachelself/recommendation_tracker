class EntriesController

  def initialize(origin_category)
    @origin_category = origin_category
    if @origin_category.name.ends_with?("s")
      @origin_category.name = @origin_category.name.chop
    end
  end

  def add
    puts "What #{@origin_category.name.downcase} would you like to add?"
    name = clean_gets
    puts "Write a short note about this recommendation."
    note = clean_gets
    # puts "Who recommended this to you? (first name)"
    # friend = clean_gets.downcase

    entry = Entry.create(name: name, category: @origin_category, note: note)

    if entry.new_record?
      puts entry.errors.full_messages
    else
      puts "#{name} has been added to the #{@origin_category.name} category"
    end
  end

  def list
    puts "=============="
    puts "#{@origin_category.name.upcase} ENTRIES"
    puts "=============="
    puts "** type ADD to create a new entry // FILTER to see entries by the friend **"

    if entries
      # puts "==== #{entries} ====="
      entries.each_with_index do |entry, index|
        # puts "==== #{entry.name} ====="
        puts "#{index + 1}. #{entry.name}"
      end
      Router.navigate_entries_menu(self)
    else
      puts "You have no entries for this category."
    end
  end

  private

  def entries
    entries ||=@origin_category.entries
  end
end
