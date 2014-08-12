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

    friend_selection = prompt_for_friend
    entry = Entry.create(name: name, category: @origin_category, note: note, friend: friend_selection )
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

    if entries.count > 0
      entries.each_with_index do |entry, index|
        puts "#{index + 1}. #{entry.name}"
      end
    else
      puts "You have no entries for this category."
    end

    Router.navigate_entries_menu(self)
  end

  def prompt_for_friend
    puts "What friend made this recommendation?"
    puts "Select from the menu below, or type ADD if the friend isn't listed."
    puts "======================================="

    if friends
      friends.each_with_index do |friend|
        puts "#{friend.id} :: #{friend.name}"
      end
    else
      puts "You have no friends. Type ADD to create a new one."
    end

    command = clean_gets
    get_input(command)
  end

  def get_input(command)
    case command
    when "ADD"
      puts "What's your friend's name?"
      name = clean_gets
      friend_selection = Friend.create(name: name)
    when /\d+/
      id = command.to_i
      friend_selection = find_friend_by_id(id)
      return friend_selection
    else
      puts "I don't know that command."
      return nil
    end
  end

  def view(path_number)
    entry = entries[path_number - 1]
    if entry
      puts "#{entry.name.upcase}\n"
      puts "===================\n"
      puts "NOTE:\n"
      puts "#{entry.note}\n"
      puts "\n"
      puts "RECOMMENDED BY:\n"
      puts "#{entry.friend.name}"
    else
      puts "Sorry, entry #{path_number} doesn't exist. Please select from the menu above or ADD a new entry."
    end
  end

  private

  def entries
    entries ||=@origin_category.entries
  end

  def friends
    friends ||=Friend.all
  end

  def find_friend_by_id(id)
    friend = Friend.where(id: id).first
    if friend.blank?
      puts "No friend found by that ID. Please re-type or ADD to create new."
    else
      friend
    end
  end
end
