# User Types
* Tracker: the people keeping track of recommendations

# Features
* View all categories
* Enter new category to track
* View entries in the category
* Add new entries to the category
* Add note to the entry
* Mark an entry as complete
* Find entries by friend

# Stories

## Tracker enters a new category

As a tracker
In order to better organize my recommendations
I want to enter a new category to track recommendations by.
Usage: ./rectrack add "Books"

Acceptance Criteria:
* This builds on the all categories screen
* User is prompted with "What category would you like to add?"
* The category is recorded in the category model

## Tracker views a category's entries

As a tracker
In order to review my recommendations
I want to read the entries for a particular category
Usage: ./rectrack "1"

Acceptance Criteria:
* Tracker navigates through categories and selects one (via it's display number) to view it's entries
* Displays the category being reviewed
* Displays the entries for that category

## Tracker adds a new entry

As a tracker
In order to remember a specific new recommendation
I want to enter a new entry for that category.
Usage: ./rectrack "1" "add"

Acceptance Criteria:
* This builds on the category details screen
* User is prompted with "Enter the menu item number to review an entry, or type ADD to add a new entry, or type FILTER to narrow the results."
* Entry is recorded in the entries model

## Tracker marks an entry fulfilled

As a tracker
In order to manage my recommendations having been taken or not,
I want to mark a recommendation entry as "fulfilled".
Usage: ./rectrack "1" "1" "y"

Acceptance Criteria:
* This builds on the entry details screen
* User is prompted with "Recommendation fulfilled yet? y/n"
* Entry is updated in the entries model
* If the entry has been marked "fulfilled", the user is shown "You fulfilled this recommendation on: July 1st 2014 at 14:40" (or similar).

## Tracker filters category entries by friend

As a tracker
In order to review recommendations with more specificity,
I want to enter a friend's name as filter criteria to narrow the entries displayed for a category
Usage: ./rectrack "1" "FILTER" "Jenna"

Acceptance Criteria:
* This builds on the category details screen
* User is prompted with "Enter the menu item number to review an entry, or type ADD to add a new entry, or type FILTER to narrow the results."
* User is prompted with "Which friend would you like to find recommendations from? (first name)"
  * If there are more than one records by that first name, prompt "What's your friend's last name?"
  * 
