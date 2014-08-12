class EntriesController

  attr_reader :origin_category

  LINES = "=============="
  ENTRY_INSTRUCTIONS = "** type ADD to create a new entry // FILTER to see entries by the friend **"
  ADD_FRIEND_INSTRUCTIONS = "Select from the menu below, or type ADD if the friend isn't listed."
  FRIEND_ERROR = "No friend found by that ID. Please re-type or ADD to create new."
  NO_ENTRIES = "You have no entries for this category."

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
    puts LINES
    puts "#{@origin_category.name.upcase} ENTRIES"
    puts LINES
    puts ENTRY_INSTRUCTIONS

    if entries.count > 0
      entries.each_with_index do |entry, index|
        puts "#{index + 1}. #{entry.name}"
      end
    else
      puts NO_ENTRIES
    end

    Router.navigate_entries_menu(self)
  end

  def prompt_for_friend
    puts "What friend made this recommendation?"
    puts "Select from the menu below, or type ADD if the friend isn't listed."
    puts LINES

    if friends
      friends.each_with_index do |friend|
        puts "#{friend.id} :: #{friend.name}"
      end
    else
      puts "You have no friends. Type ADD to create a new one."
    end

    command = clean_gets
    get_friend_name(command)
  end

  def get_friend_name(command)
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
      puts LINES + "\n"
      puts "NOTE:\n"
      puts "#{entry.note}\n"
      puts "\n"
      puts "RECOMMENDED BY:\n"
      puts "#{entry.friend.name}"
    else
      puts "Sorry, entry #{path_number} doesn't exist. Please select from the menu above or ADD a new entry."
    end
  end

  def friends_menu
    puts LINES
    puts "What friend would you like to filter by?"
    puts LINES
    all_friends = friends
    all_friends.each_with_index do |friend, index|
      puts "#{index + 1}. #{friend.name}"
    end

    friend_selection = clean_gets

    if friend_selection.to_i > all_friends.count || friend_selection.to_i <= 0
      puts "Sorry, friend #{friend_selection} doesn't exist. Please choose a friend off existing menu."
      return
    end

    friend = find_friend_by_id(friend_selection)
    filter(friend)
  end

  def filter(friend)
    entries = Entry.where(category: @origin_category, friend: friend)

    if entries.empty?
      puts "Your friend #{friend.name} hasn't made any recommendations in the #{@origin_category.name} category."
    else
      puts "#{entries.count} entries found for #{friend.name} in the #{@origin_category.name} category!"
      print_results(friend, entries)
      entries.each_with_index do |entry, index|
        puts "#{index + 1}. #{entry.name}"
      end
      Router.navigate_entries_menu(self)
    end
  end

  def print_results(friend, entries)
    puts LINES
    puts "#{@origin_category.name.upcase} RECOMMENDATIONS BY #{friend.name.upcase}"
    puts LINES
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
      puts FRIEND_ERROR
    else
      friend
    end
  end
end
