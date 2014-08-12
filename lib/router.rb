class Router

  def self.navigate_categories_menu(categories_controller)
    command = clean_gets

    case command
    when "ADD"
      categories_controller.add
    when /\d+/
      categories_controller.view(command.to_i)
    else
      puts "I don't know the '#{command}' command."
    end
  end

  def self.navigate_entries_menu(entries_controller)
    command = clean_gets

    case command
    when "ADD"
      entries_controller.add
    when /\d+/
      entries_controller.view(command.to_i)
    when "FILTER"
      puts "========================================="
      # puts "Select from the menu below."
      # puts "What friend would you like to filter by?"
      # puts "========================================="
      # friends_controller.show_all
      # friend = clean_gets
      # entries_controller.filter(friend)
    end
  end

end
