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
  And I fill the "activity-start-time" field with "9:00 AM"
  And I fill the "activity-end-time" field with "9:30 AM"
  And I fill the "activity-frequency" field with "Não repetir"
  And I tap the "confirm-activity" button
  Then I expect the button "schedule-edit-button" to be present within 5 seconds
