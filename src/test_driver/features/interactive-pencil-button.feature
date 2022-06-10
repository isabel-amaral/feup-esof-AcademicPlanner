Feature: Interactive Pencil Button
  Three other buttons: 'Editar Evento', 'Alterar Visibilidade' e 'Adicionar Evento' should be displayed when 'Pencil' button is tapped

  Scenario: Tap the 'Pencil' button and see the 'Editar Evento' button
    Given I expect the "page-title" to be "Área Pessoal"
    And I open the drawer
    And I tap the "Agenda" button
    And I pause for 3 seconds
    When I tap the "schedule-edit-button" button
    Then I expect the button "edit-activity-button" to be present within 5 seconds

  Scenario: Tap the 'Pencil' button and see the 'Alterar Visibilidade' button
    Given I expect the "page-title" to be "Área Pessoal"
    And I open the drawer
    And I tap the "Agenda" button
    And I pause for 3 seconds
    When I tap the "schedule-edit-button" button
    Then I expect the button "change-visibility-button" to be present within 5 seconds

  Scenario: Tap the 'Pencil' button and see the 'Adicionar Evento' button
    Given I expect the "page-title" to be "Área Pessoal"
    And I open the drawer
    And I tap the "Agenda" button
    And I pause for 3 seconds
    When I tap the "schedule-edit-button" button
    Then I expect the button "add-activity-button" to be present within 5 seconds
