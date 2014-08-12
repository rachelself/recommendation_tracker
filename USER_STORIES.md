# User Types
* Tracker: the users keeping track of recommendations

# Features
* View all categories
* Enter new category
* View entries in the category
* Add a new entry to the category
* Filter entries by friend
* View entry details

# Stories

## Tracker enters a new category

As a tracker,
in order to better organize my recommendations,
I want to enter a new recommendations category.

**Usage:**

`./rectrack` => user sees list of all categories with display numbers

`ADD` => user is prompted with "What category would you like to add?"

`Books` => screen displays: "Books has been added as a new category"

**Acceptance Criteria:**
* This builds on the categories screen
* User enters `ADD`
* User is prompted with "What category would you like to add?"
* User enters valid input for their category name
  * valid if it is not a duplicate
  * valid if input is a string
  * valid if input contains letters
  * valid if length is less than 30 characters
* The category is recorded in the category model

## Tracker views a category's entries

As a tracker who has previously used the app,
in order to review past recommendations,
I want to see the entries for a particular category.

**Usage:**

`./rectrack` => user sees list of all categories with display numbers

`1` => user sees list of all entries for that category and is prompted with "Enter the menu item number to view an entry, type ADD to make a new entry, or type FILTER to narrow your results."

**Acceptance Criteria:**
* Tracker selects a category (via it's display number) to view it's entries
* Displays the category being reviewed
* Displays the entries for that category

## Tracker adds a new entry for a friend already in the database

As a tracker,
in order to remember a specific new recommendation,
I want to add a new entry.

**Usage:**

`./rectrack` => user sees list of all categories with display numbers

`1` => user sees list of all entries for that category and is prompted with "Enter the menu item number to view an entry, type ADD to make a new entry, or type FILTER to narrow your results."

`ADD` => user is prompted with "What is the title of your entry (name of the restaurant, title of the book, etc)"

`A Tale of Two Cities` => user is prompted with "Write a short note about this recommendation."

`An amazing book Jenna read in 8th grade` => user is prompted with "Which friend recommended this to you?", a menu of friends to choose from, and instructions: "Select from the menu below, or type ADD if the friend isn't listed."

`1` => prints "A Tale of Two Cities has been added to the database."


**Acceptance Criteria:**
* This builds on the category details screen
* User enters display number of category
* User enters `ADD` to create a new entry
* User enters valid input for name of the entry
  * valid if a string
  * valid if length is less than 30 characters
* User is prompted with "Write a short note about this recommendation."
  * valid input is a string
* User is prompted to choose a friend off the menu (via its display number) or type ADD to create a new one
  * valid input is a digit corresponding to the menu display numbers
* Entry is recorded in the entries model

## Tracker adds a new entry for a friend that is NOT in the database

As a tracker,
in order to remember a specific new recommendation,
I want to add a new entry for a friend who hasn't made recommendations to me previously.

**Usage:**

`./rectrack` => user sees list of all categories with display numbers

`1` => user sees list of all entries for that category and is prompted with "Enter the menu item number to view an entry, type ADD to make a new entry, or type FILTER to narrow your results."

`ADD` => user is prompted with "What is the title of your entry (name of the restaurant, title of the book, etc)"

`Perelandra` => user is prompted with "Write a short note about this recommendation."

`An amazing book Jenna read in 8th grade` => user is prompted with "Which friend recommended this to you?", a menu of friends to choose from, and instructions: "Select from the menu below, or type ADD if the friend isn't listed."

`ADD` => user is prompted with "What is your friend's name?"

`Pete` => prints "Perelandra has been added to the database."


**Acceptance Criteria:**
* This builds on the category details screen
* User enters display number of category
* User enters `ADD` to create a new entry
* User enters valid input for name of the entry
  * valid if a string
  * valid if length is less than 30 characters
* User is prompted with "Write a short note about this recommendation."
  * valid input is a string
* User is prompted to choose a friend off the menu (via its display number) or type ADD to create a new one
  * valid input is a string
  * valid input is length less than 30 characters
  * valid input must contain letters
* Entry is recorded in the entries model


## Tracker views an entry

As a tracker who has previously used the app,
in order to review my recommendations,
I want to view a specific entry.

**Usage:**

`./rectrack` => user sees list of all categories with display numbers

`1` => user sees list of all entries for that category and is prompted with "Enter the menu item number to view an entry, type ADD to make a new entry, or type FILTER to narrow your results."

`1` => prints the entry details

**Acceptance Criteria:**
* This builds on the entry details screen
* User enters display number of category
* User enters the display number of the entry

## Tracker filters entries by friend

As a tracker who has previously used the app,
in order to review recommendations with more specificity,
I want to enter a friend's name as filter criteria.

**Usage:**

`./rectrack` => user sees list of all categories with display numbers

`1` => user sees list of all entries for that category and is prompted with "Enter the menu item number to view an entry, type ADD to make a new entry, or type FILTER to narrow your results."

`FILTER` => user is prompted with "Which friend would you like to filter by?" and a menu of friends to choose from.

`1` => If there are entries by that friend under that category, print out the entries with menu display numbers.

`1` => prints the details of that entry

**Acceptance Criteria:**
* This builds on the category details screen
* User enters display number of category
* User enters `FILTER`
* User is prompted to choose a friend from the menu
  * valid input is a digit corresponding to the menu
* User is prompted choose from the entries.
  * valid input is a digit corresponding to the menu
