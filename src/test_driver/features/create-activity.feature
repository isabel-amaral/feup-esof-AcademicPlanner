Feature: Create New Activity
  Several fields from the form should be filled and a new activity must be created

Scenario: Add new activity
  Given I expect the "page-title" to be "Área Pessoal"
  And I open the drawer
  And I tap the "Agenda" button
  And I pause for 5 seconds
  And I tap the "schedule-edit-button" button
  And I pause for 5 seconds
  And I tap the "add-activity-button" button
  When I fill the "activity-name" field with "Activity1"
  And I fill the "activity-description" field with "This is the first activity"
  And I fill the "activity-date" field with "2022/06/10"
  And I tap the button that contains the text "OK"
  And I fill the "activity-start-time" field with "9:00 AM"
  And I tap the button that contains the text "OK"
  And I fill the "activity-end-time" field with "9:30 AM"
  And I tap the button that contains the text "OK"
  And I tap the "confirm-activity" button
  Then I expect the widget "Activity1" to be present within 5 seconds

Scenario: Add new activity
  Given I expect the "page-title" to be "Área Pessoal"
  And I open the drawer
  And I tap the "Agenda" button
  And I pause for 5 seconds
  And I tap the "schedule-edit-button" button
  And I pause for 5 seconds
  And I tap the "add-activity-button" button
  When I fill the "activity-name" field with "Activity2"
  And I fill the "activity-description" field with "This is the second activity"
  And I fill the "activity-date" field with "2022/06/11"
  And I tap the button that contains the text "OK"
  And I fill the "activity-start-time" field with "10:00 AM"
  And I tap the button that contains the text "OK"
  And I fill the "activity-end-time" field with "10:30 AM"
  And I tap the button that contains the text "OK"
  And I tap the "confirm-activity" button
  Then I expect the widget "Activity2" to be present within 5 seconds

Scenario: Add new activity
  Given I expect the "page-title" to be "Área Pessoal"
  And I open the drawer
  And I tap the "Agenda" button
  And I pause for 5 seconds
  And I tap the "schedule-edit-button" button
  And I pause for 5 seconds
  And I tap the "add-activity-button" button
  When I fill the "activity-name" field with "Activity3"
  And I fill the "activity-description" field with "This is the third activity"
  And I fill the "activity-date" field with "2022/06/12"
  And I tap the button that contains the text "OK"
  And I fill the "activity-start-time" field with "14:00 PM"
  And I tap the button that contains the text "OK"
  And I fill the "activity-end-time" field with "14:30 PM"
  And I tap the button that contains the text "OK"
  And I tap the "confirm-activity" button
  Then I expect the widget "Activity3" to be present within 5 seconds
