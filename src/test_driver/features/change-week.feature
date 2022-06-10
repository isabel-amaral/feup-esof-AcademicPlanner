Feature: Check Schedule Week
  The week start and end dates should be updated when the 'Semana Anterior'/'Semana Seguinte' buttons are tapped

  Scenario Outline: Moves to next week when the button is pressed (1)
    Given I expect the "page-title" to be "Área Pessoal"
    And I open the drawer
    And I tap the "Agenda" button
    And I expect the "<tab1>" to be "<date1>"
    And I pause for 3 seconds
    When I tap the "next-week-button" button
    Then I expect the "<tab2>" to be "<date2>"

    # 6/06 week: change date1 to current week's values
    Examples:
      |            tab1         | date1 |            tab2         | date2 |
      | calendar-page-tab-day-0 | 6/6   | calendar-page-tab-day-0 | 13/6  |
      | calendar-page-tab-day-1 | 7/6   | calendar-page-tab-day-1 | 14/6  |
      | calendar-page-tab-day-2 | 8/6   | calendar-page-tab-day-2 | 15/6  |
      | calendar-page-tab-day-2 | 8/6   | calendar-page-tab-day-2 | 15/6  |
      | calendar-page-tab-day-3 | 9/6   | calendar-page-tab-day-3 | 16/6  |
      | calendar-page-tab-day-4 | 10/6  | calendar-page-tab-day-4 | 17/6  |
      | calendar-page-tab-day-5 | 11/6  | calendar-page-tab-day-5 | 18/6  |
      | calendar-page-tab-day-6 | 12/6  | calendar-page-tab-day-6 | 19/6  |
      | calendar-page-tab-day-0 | 6/6   | calendar-page-tab-day-1 | 14/6  |
      | calendar-page-tab-day-0 | 6/6   | calendar-page-tab-day-2 | 15/6  |

  Scenario Outline: Moves to next week when the button is pressed (2)
    Given I expect the "page-title" to be "Área Pessoal"
    And I open the drawer
    And I tap the "Agenda" button
    And I expect the "<tab1>" to be "<day1>"
    And I pause for 3 seconds
    When I tap the "next-week-button" button
    Then I expect the "<tab2>" to be "<day2>"

    Examples:
      |            tab1           |  day1 |            tab2           |  day2 |
      |calendar-page-tab-weekday-0|Segunda|calendar-page-tab-weekday-0|Segunda|
      |calendar-page-tab-weekday-1| Terça |calendar-page-tab-weekday-1| Terça |
      |calendar-page-tab-weekday-2| Quarta|calendar-page-tab-weekday-2| Quarta|
      |calendar-page-tab-weekday-3| Quinta|calendar-page-tab-weekday-3| Quinta|
      |calendar-page-tab-weekday-4| Sexta |calendar-page-tab-weekday-4| Sexta |
      |calendar-page-tab-weekday-5| Sábado|calendar-page-tab-weekday-5| Sábado|
      |calendar-page-tab-weekday-6|Domingo|calendar-page-tab-weekday-6|Domingo|
      |calendar-page-tab-weekday-0|Segunda|calendar-page-tab-weekday-1| Terça |
      |calendar-page-tab-weekday-0|Segunda|calendar-page-tab-weekday-2| Quarta|

  Scenario Outline: Moves to next week when the button is pressed (3)
    Given I expect the "page-title" to be "Área Pessoal"
    And I open the drawer
    And I tap the "Agenda" button
    And I expect the "<tab1>" to be "<date1>"
    And I pause for 3 seconds
    When I tap the "next-week-button" button <n> times
    Then I expect the "<tab2>" to be "<date2>"

    # 6/06 week: change date1 to current week's values
    Examples:
      |          tab1         | date1 | n |          tab2       | date2 |
      |calendar-page-tab-day-0|  6/6  | 2 |calendar-page-tab-day-0|  20/6 |
      |calendar-page-tab-day-1|  7/6  | 2 |calendar-page-tab-day-1|  21/6 |
      |calendar-page-tab-day-2|  8/6  | 2 |calendar-page-tab-day-2|  22/6 |
      |calendar-page-tab-day-3|  9/6  | 2 |calendar-page-tab-day-3|  23/6 |
      |calendar-page-tab-day-4|  10/6 | 2 |calendar-page-tab-day-4|  24/6 |
      |calendar-page-tab-day-5|  11/6 | 2 |calendar-page-tab-day-5|  25/6 |
      |calendar-page-tab-day-6|  12/6 | 2 |calendar-page-tab-day-6|  26/6 |
      |calendar-page-tab-day-0|  6/6  | 3 |calendar-page-tab-day-0|  27/6 |
      |calendar-page-tab-day-1|  7/6  | 3 |calendar-page-tab-day-1|  28/6 |
      |calendar-page-tab-day-2|  8/6  | 3 |calendar-page-tab-day-2|  29/6 |
      |calendar-page-tab-day-3|  9/6  | 3 |calendar-page-tab-day-3|  30/6 |
      |calendar-page-tab-day-4|  10/6 | 3 |calendar-page-tab-day-4|   1/7 |
      |calendar-page-tab-day-5|  11/6 | 3 |calendar-page-tab-day-5|   2/7 |
      |calendar-page-tab-day-6|  12/6 | 3 |calendar-page-tab-day-6|   3/7 |
      |calendar-page-tab-day-0|  6/6  | 4 |calendar-page-tab-day-0|   4/7 |
      |calendar-page-tab-day-1|  7/6  | 4 |calendar-page-tab-day-1|   5/7 |
      |calendar-page-tab-day-2|  8/6  | 4 |calendar-page-tab-day-2|   6/7 |
      |calendar-page-tab-day-3|  9/6  | 4 |calendar-page-tab-day-3|   7/7 |
      |calendar-page-tab-day-4|  10/6 | 4 |calendar-page-tab-day-4|   8/7 |
      |calendar-page-tab-day-5|  11/6 | 4 |calendar-page-tab-day-5|   9/7 |
      |calendar-page-tab-day-6|  12/6 | 4 |calendar-page-tab-day-6|  10/7 |

  Scenario Outline: Moves to previous week when the button is pressed (1)
    Given I expect the "page-title" to be "Área Pessoal"
    And I open the drawer
    And I tap the "Agenda" button
    And I expect the "<tab1>" to be "<date1>"
    And I pause for 3 seconds
    When I tap the "previous-week-button" button
    Then I expect the "<tab2>" to be "<date2>"

    # 6/06 week: change date1 to current week's values
    Examples:
      |          tab1         | date1 |          tab2         | date2 |
      | calendar-page-tab-day-0 | 6/6   | calendar-page-tab-day-0 | 30/5  |
      | calendar-page-tab-day-1 | 7/6   | calendar-page-tab-day-1 | 31/5  |
      | calendar-page-tab-day-2 | 8/6   | calendar-page-tab-day-2 |  1/6  |
      | calendar-page-tab-day-3 | 9/6   | calendar-page-tab-day-3 |  2/6  |
      | calendar-page-tab-day-4 | 10/6  | calendar-page-tab-day-4 |  3/6  |
      | calendar-page-tab-day-5 | 11/6  | calendar-page-tab-day-5 |  4/6  |
      | calendar-page-tab-day-6 | 12/6  | calendar-page-tab-day-6 |  5/6  |
      | calendar-page-tab-day-0 | 6/6   | calendar-page-tab-day-1 | 31/5  |
      | calendar-page-tab-day-0 | 6/6   | calendar-page-tab-day-2 |  1/6  |

  Scenario Outline: Moves to previous week when the button is pressed (2)
    Given I expect the "page-title" to be "Área Pessoal"
    And I open the drawer
    And I tap the "Agenda" button
    And I expect the "<tab1>" to be "<day1>"
    And I pause for 3 seconds
    When I tap the "previous-week-button" button
    Then I expect the "<tab2>" to be "<day2>"

    Examples:
      |            tab1           |  day1 |            tab2           |  day2 |
      |calendar-page-tab-weekday-0|Segunda|calendar-page-tab-weekday-0|Segunda|
      |calendar-page-tab-weekday-1| Terça |calendar-page-tab-weekday-1| Terça |
      |calendar-page-tab-weekday-2| Quarta|calendar-page-tab-weekday-2| Quarta|
      |calendar-page-tab-weekday-3| Quinta|calendar-page-tab-weekday-3| Quinta|
      |calendar-page-tab-weekday-4| Sexta |calendar-page-tab-weekday-4| Sexta |
      |calendar-page-tab-weekday-5| Sábado|calendar-page-tab-weekday-5| Sábado|
      |calendar-page-tab-weekday-6|Domingo|calendar-page-tab-weekday-6|Domingo|
      |calendar-page-tab-weekday-0|Segunda|calendar-page-tab-weekday-1| Terça |
      |calendar-page-tab-weekday-0|Segunda|calendar-page-tab-weekday-2| Quarta|

  Scenario Outline: Moves to previous week when the button is pressed (3)
    Given I expect the "page-title" to be "Área Pessoal"
    And I open the drawer
    And I tap the "Agenda" button
    And I expect the "<tab1>" to be "<date1>"
    And I pause for 3 seconds
    When I tap the "previous-week-button" button <n> times
    Then I expect the "<tab2>" to be "<date2>"

    # 6/06 week: change date1 to current week's values
    Examples:
      |          tab1         | date1 | n |          tab2         | date2 |
      |calendar-page-tab-day-0|  6/6  | 2 |calendar-page-tab-day-0|  23/5 |
      |calendar-page-tab-day-1|  7/6  | 2 |calendar-page-tab-day-1|  24/5 |
      |calendar-page-tab-day-2|  8/6  | 2 |calendar-page-tab-day-2|  25/5 |
      |calendar-page-tab-day-3|  9/6  | 2 |calendar-page-tab-day-3|  26/5 |
      |calendar-page-tab-day-4|  10/6 | 2 |calendar-page-tab-day-4|  27/5 |
      |calendar-page-tab-day-5|  11/6 | 2 |calendar-page-tab-day-5|  28/5 |
      |calendar-page-tab-day-6|  12/6 | 2 |calendar-page-tab-day-6|  29/5 |
      |calendar-page-tab-day-0|  6/6  | 3 |calendar-page-tab-day-0|  16/5 |
      |calendar-page-tab-day-1|  7/6  | 3 |calendar-page-tab-day-1|  17/5 |
      |calendar-page-tab-day-2|  8/6  | 3 |calendar-page-tab-day-2|  18/5 |
      |calendar-page-tab-day-3|  9/6  | 3 |calendar-page-tab-day-3|  19/5 |
      |calendar-page-tab-day-4|  10/6 | 3 |calendar-page-tab-day-4|  20/5 |
      |calendar-page-tab-day-5|  11/6 | 3 |calendar-page-tab-day-5|  21/5 |
      |calendar-page-tab-day-6|  12/6 | 3 |calendar-page-tab-day-6|  22/5 |
      |calendar-page-tab-day-0|  6/6  | 4 |calendar-page-tab-day-0|   9/5 |
      |calendar-page-tab-day-1|  7/6  | 4 |calendar-page-tab-day-1|  10/5 |
      |calendar-page-tab-day-2|  8/6  | 4 |calendar-page-tab-day-2|  11/5 |
      |calendar-page-tab-day-3|  9/6  | 4 |calendar-page-tab-day-3|  12/5 |
      |calendar-page-tab-day-4|  10/6 | 4 |calendar-page-tab-day-4|  13/5 |
      |calendar-page-tab-day-5|  11/6 | 4 |calendar-page-tab-day-5|  14/5 |
      |calendar-page-tab-day-6|  12/6 | 4 |calendar-page-tab-day-6|  15/5 |

  Scenario Outline: Both buttons are pressed (1)
    Given I expect the "page-title" to be "Área Pessoal"
    And I open the drawer
    And I tap the "Agenda" button
    And I expect the "<tab1>" to be "<date1>"
    And I pause for 3 seconds
    When I tap the "next-week-button" button <n1> times
    And I tap the "previous-week-button" button <n2> times
    Then I expect the "<tab2>" to be "<date2>"

    Examples:
      |          tab1         | date1 | n1 | n2 |          tab2         | date2 |
      |calendar-page-tab-day-0|   6/6 | 1  | 1  |calendar-page-tab-day-0|   6/6 |
      |calendar-page-tab-day-1|   7/6 | 1  | 1  |calendar-page-tab-day-1|   7/6 |
      |calendar-page-tab-day-2|   8/6 | 1  | 1  |calendar-page-tab-day-2|   8/6 |
      |calendar-page-tab-day-0|   6/6 | 2  | 2  |calendar-page-tab-day-0|   6/6 |
      |calendar-page-tab-day-1|   7/6 | 2  | 2  |calendar-page-tab-day-1|   7/6 |
      |calendar-page-tab-day-2|   8/6 | 2  | 2  |calendar-page-tab-day-2|   8/6 |
      |calendar-page-tab-day-0|   6/6 | 3  | 3  |calendar-page-tab-day-0|   6/6 |
      |calendar-page-tab-day-1|   7/6 | 3  | 3  |calendar-page-tab-day-1|   7/6 |
      |calendar-page-tab-day-2|   8/6 | 3  | 3  |calendar-page-tab-day-2|   8/6 |
      |calendar-page-tab-day-0|   6/6 | 2  | 1  |calendar-page-tab-day-0|  13/6 |
      |calendar-page-tab-day-1|   7/6 | 2  | 1  |calendar-page-tab-day-1|  14/6 |
      |calendar-page-tab-day-2|   8/6 | 2  | 1  |calendar-page-tab-day-2|  15/6 |
      |calendar-page-tab-day-0|   6/6 | 1  | 2  |calendar-page-tab-day-0|  30/5 |
      |calendar-page-tab-day-1|   7/6 | 1  | 2  |calendar-page-tab-day-1|  31/5 |
      |calendar-page-tab-day-2|   8/6 | 1  | 2  |calendar-page-tab-day-2|   1/6 |
