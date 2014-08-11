class CategoriesController

  def add
    puts "What category would you like to add?"
    name = clean_gets
    category = Category.create(name: name)
    if category.new_record?
      puts category.errors.full_messages
    else
      puts "#{name} has been added to the list of categories"
    end
  end

  def list
    puts "=============="
    puts "CATEGORIES"
    puts "=============="
    puts "** type ADD to create a new category **"
    if categories
      categories.each_with_index do |category, index|
        puts "#{index + 1}. #{category.name}"
      end
      Router.navigate_categories_menu(self)
    else
      puts "You have no categories yet."
    end
  end

  def view(path_number)
    category = categories[path_number - 1]
    if category
      puts "Looking up recommendations for #{category.name}..."
      entries_controller = EntriesController.new(category)
      entries_controller.list
    else
      puts "Sorry, category #{path_number} doesn't exist."
    end
  end

  private

  def categories
    categories ||= Category.all
  end
end
