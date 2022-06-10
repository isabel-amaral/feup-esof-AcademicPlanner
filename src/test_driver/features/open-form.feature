Feature: Create New Event Form
  A form with several fields should be displayed when the 'Alterar Visibilidade' button is tapped

  Scenario: Tap the 'Alterar Visibilidade' button and see the activity name text field widget
    Given I expect the "page-title" to be "Área Pessoal"
    And I open the drawer
    And I tap the "Agenda" button
    And I pause for 5 seconds
    And I tap the "schedule-edit-button" button
    And I pause for 5 seconds
    When I tap the "add-activity-button" button
    Then I expect the field "activity-name" to be present within 5 seconds

  Scenario: Tap the 'Alterar Visibilidade' button and see the activity description text field widget
    Given I expect the "page-title" to be "Área Pessoal"
    And I open the drawer
    And I tap the "Agenda" button
    And I pause for 5 seconds
    And I tap the "schedule-edit-button" button
    And I pause for 5 seconds
    When I tap the "add-activity-button" button
    Then I expect the field "activity-description" to be present within 5 seconds

  Scenario: Tap the 'Alterar Visibilidade' button and see the activity date text field widget
    Given I expect the "page-title" to be "Área Pessoal"
    And I open the drawer
    And I tap the "Agenda" button
    And I pause for 5 seconds
    And I tap the "schedule-edit-button" button
    And I pause for 5 seconds
    When I tap the "add-activity-button" button
    Then I expect the field "activity-date" to be present within 5 seconds

  Scenario: Tap the 'Alterar Visibilidade' button and see the activity start time text field widget
    Given I expect the "page-title" to be "Área Pessoal"
    And I open the drawer
    And I tap the "Agenda" button
    And I pause for 5 seconds
    And I tap the "schedule-edit-button" button
    And I pause for 5 seconds
    When I tap the "add-activity-button" button
    Then I expect the field "activity-start-time" to be present within 5 seconds

  Scenario: Tap the 'Alterar Visibilidade' button and see the activity end time text field widget
    Given I expect the "page-title" to be "Área Pessoal"
    And I open the drawer
    And I tap the "Agenda" button
    And I pause for 5 seconds
    And I tap the "schedule-edit-button" button
    And I pause for 5 seconds
    When I tap the "add-activity-button" button
    Then I expect the field "activity-end-time" to be present within 5 seconds

  Scenario: Tap the 'Alterar Visibilidade' button and see the activity frequency dropdown widget
    Given I expect the "page-title" to be "Área Pessoal"
    And I open the drawer
    And I tap the "Agenda" button
    And I pause for 5 seconds
    And I tap the "schedule-edit-button" button
    And I pause for 5 seconds
    When I tap the "add-activity-button" button
    Then I expect the field "activity-frequency" to be present within 5 seconds

  Scenario: Tap the 'Alterar Visibilidade' button and see the activity color label dropdown widget
    Given I expect the "page-title" to be "Área Pessoal"
    And I open the drawer
    And I tap the "Agenda" button
    And I pause for 5 seconds
    And I tap the "schedule-edit-button" button
    And I pause for 5 seconds
    When I tap the "add-activity-button" button
    Then I expect the field "activity-color" to be present within 5 seconds
