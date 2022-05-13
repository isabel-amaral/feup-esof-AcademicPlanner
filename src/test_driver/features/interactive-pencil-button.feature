Feature: Interactive Pencil Button
  Three other buttons: 'Editar Evento', 'Alterar Visibilidade' e 'Adicionar Evento' should be displayed when 'Pencil' button is tapped

  Scenario: Tap the 'Pencil' button and see the 'Editar Evento' button
    Given the "Agenda" screen
    When I tap the "schedule-edit-button" button
    Then I expect the "edit-activity-button" to be present within 5 seconds

  Scenario: Tap the 'Pencil' button and see the 'Alterar Visibilidade' button
    Given the "Agenda" screen
    When I tap the "schedule-edit-button" button
    Then I expect the "change-visibility-button" to be present within 5 seconds

  Scenario: Tap the 'Pencil' button and see the 'Adicionar Evento' button
    Given the "Agenda" screen
    When I tap the "schedule-edit-button" button
    Then I expect the "add-activity-button" to be present within 5 seconds
