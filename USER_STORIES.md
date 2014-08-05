# User Types
* Tracker: the users keeping track of recommendations

# Features
* View all categories
* Enter new category to track
* View entries in the category
* Add new entries to the category
* Mark an entry as fulfilled
* Find entries by friend

# Stories

## Tracker enters a new category

As a tracker,
in order to better organize my recommendations,
I want to enter a new recommendations category.

**Usage:**

`./rectrack` => user sees list of all categories with display numbers

`add` => user is prompted with "What category would you like to add?"

`Books` => screen displays: "Books has been added as a new category"

**Acceptance Criteria:**
* This builds on the categories screen
* User enters `add`
* User is prompted with "What category would you like to add?"
* User enters valid input for their category name
  * valid if it is not a duplicate
  * valid if input is a string
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

## Tracker adds a new entry

As a tracker,
in order to remember a specific new recommendation,
I want to enter a new entry.

**Usage:**

`./rectrack` => user sees list of all categories with display numbers

`1` => user sees list of all entries for that category and is prompted with "Enter the menu item number to view an entry, type ADD to make a new entry, or type FILTER to narrow your results."

`add` => user is prompted with "What is the title of your entry (name of the restaurant, title of the book, etc)"

`A Tale of Two Cities` => user is prompted with "Who recommended this to you? (first name)"

`Jenna` => if a record for Jenna exists in the database, user is prompted with "Is one of these the right Jenna?" and prints out that record(s) with display numbers

`1` => user is prompted with "Add a short note about this recommendation."

`An amazing book Jenna read in 8th grade` => prints "A Tale of Two Cities has been added to the database."

**Acceptance Criteria:**
* This builds on the category details screen
* User enters display number of category
* User enters `add` to create a new entry
* User enters valid input for name of the entry
  * valid if a string
* User enters valid input for first name of friend
   * valid if a string
* If a record is found in the database for that friend, user will be prompted with "Is one of these the right #{friend}?"
  * valid input is a digit corresponding to the menu display numbers
* User is prompted with "Add a short note about this recommendation."
  * valid input is a string
* Entry is recorded in the entries model

## Tracker edits an existing entry

As a tracker who has previously used the app,
in order to manage my recommendations,
I want to edit a specific entry.

**Usage:**

`./rectrack` => user sees list of all categories with display numbers

`1` => user sees list of all entries for that category and is prompted with "Enter the menu item number to view an entry, type ADD to make a new entry, or type FILTER to narrow your results."

`1` => user is prompted with "Type EDIT to make changes to this entry or BACK to go back"

`EDIT` => user is prompted with a menu with display number for items to edit.

`1` => Please enter a new #{name} for the entry

`Great Expectations` => user is prompted with "Great Expectations has been added to the database."

**Acceptance Criteria:**
* This builds on the category details screen
* User enters display number of category
* User enters the display number of the entry
* User enters `EDIT`
* User enters the display number of the item to edit
* User enters valid input
   * valid if a string
* Entry is recorded in the entries model

## Tracker filters category entries by friend

As a tracker who has previously used the app,
in order to review recommendations with more specificity,
I want to enter a friend's name as filter criteria.

**Usage:**

`./rectrack` => user sees list of all categories with display numbers

`1` => user sees list of all entries for that category and is prompted with "Enter the menu item number to view an entry, type ADD to make a new entry, or type FILTER to narrow your results."

`FILTER` => user is prompted with "What is the first name of the friend who made the recommendation?"

`Jenna` => If there are records for that name, print out the records with menu display numbers and prompt "Are any of these the correct Jenna?"

`1` => prints menu of entries containing that friend ID

**Acceptance Criteria:**
* This builds on the category details screen
* User enters display number of category
* User enters `FILTER`
* User is prompted to enter the first name of a friend to filter by
  * valid input is a string
* User is prompted to enter a menu display number for the correct friend to filter by
  * valid input is a digit corresponding to the menu
