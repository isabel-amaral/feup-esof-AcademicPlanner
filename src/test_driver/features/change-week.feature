Feature: Check Schedule Week
    The week start and end dates should be updated when the 'Semana Anterior'/'Semana Seguinte' buttons are tapped

    Scenario Outline: Moves to next week when the button is pressed (1)
        Given I expect the "<tab1>" to be "<date1>"
        When I tap the "next-week-button" button
        Then I expect the "<tab2>" to be "<date2>"

        Examples:
            |          tab1         | date1 |          tab2         | date2 |
            # 9/05 week
            |calendar-page-tab-day-0|  9/5  |calendar-page-tab-day-0|  16/5 |
            |calendar-page-tab-day-1|  10/5 |calendar-page-tab-day-1|  17/5 |
            |calendar-page-tab-day-2|  11/5 |calendar-page-tab-day-2|  18/5 |
            |calendar-page-tab-day-0|  9/5  |calendar-page-tab-day-1|  17/5 |
            |calendar-page-tab-day-0|  9/5  |calendar-page-tab-day-2|  18/5 |
            #16/05 week
            |calendar-page-tab-day-0|  16/5  |calendar-page-tab-day-0| 23/5 |
            |calendar-page-tab-day-1|  17/5  |calendar-page-tab-day-1| 24/5 |
            |calendar-page-tab-day-2|  18/5  |calendar-page-tab-day-2| 25/5 |
            |calendar-page-tab-day-0|  16/5  |calendar-page-tab-day-1| 24/5 |
            |calendar-page-tab-day-0|  16/5  |calendar-page-tab-day-2| 25/5 |
            #30/05 week (changes month)
            |calendar-page-tab-day-0|  30/5  |calendar-page-tab-day-0|  6/6 |
            |calendar-page-tab-day-1|  31/5  |calendar-page-tab-day-1|  7/6 |
            |calendar-page-tab-day-2|   1/6  |calendar-page-tab-day-0|  8/6 |
            |calendar-page-tab-day-0|  30/5  |calendar-page-tab-day-1|  7/6 |
            |calendar-page-tab-day-0|  30/5  |calendar-page-tab-day-2|  8/6 |

    Scenario Outline: Moves to next week when the button is pressed (2)
        Given I expect the "<tab1>" to be "<day1>"
        When I tap the "next-week-button" button
        Then I expect the "<tab2>" to be "<day2>"

        Examples:
            |            tab1           |  day1 |            tab2           |  day2 |
            |calendar-page-tab-weekday-0|Segunda|calendar-page-tab-weekday-0|Segunda|
            |calendar-page-tab-weekday-1| Terça |calendar-page-tab-weekday-1| Terça |
            |calendar-page-tab-weekday-2| Quarta|calendar-page-tab-weekday-2| Quarta|
            |calendar-page-tab-weekday-0|Segunda|calendar-page-tab-weekday-1| Terça |
            |calendar-page-tab-weekday-0|Segunda|calendar-page-tab-weekday-2| Quarta|

    Scenario Outline: Moves to next week when the button is pressed (3)
        Given I expect the "<tab1>" to be "<date1>"
        When I tap the "next-week-button" button <n> times
        Then I expect the "<tab2>" to be "<date2>"

        Examples:
            |          tab1         | date1 | n |          tab2         | date2 |
            # 2 weeks
            |calendar-page-tab-day-0|  9/5  | 2 |calendar-page-tab-day-0|  23/5 |
            |calendar-page-tab-day-1|  10/5 | 2 |calendar-page-tab-day-1|  24/5 |
            |calendar-page-tab-day-2|  11/5 | 2 |calendar-page-tab-day-2|  25/5 |
            |calendar-page-tab-day-0|  9/5  | 2 |calendar-page-tab-day-1|  24/5 |
            |calendar-page-tab-day-0|  9/5  | 2 |calendar-page-tab-day-2|  25/5 |
            # 3 weeks
            |calendar-page-tab-day-0|  9/5  | 3 |calendar-page-tab-day-0|  30/5 |
            |calendar-page-tab-day-1|  10/5 | 3 |calendar-page-tab-day-1|  31/5 |
            |calendar-page-tab-day-2|  11/5 | 3 |calendar-page-tab-day-2|   1/6 |
            |calendar-page-tab-day-0|  9/5  | 3 |calendar-page-tab-day-1|  31/5 |
            |calendar-page-tab-day-0|  9/5  | 3 |calendar-page-tab-day-2|   1/6 |
            # 4 weeks
            |calendar-page-tab-day-0|  9/5  | 4 |calendar-page-tab-day-0|   6/6 |
            |calendar-page-tab-day-1|  10/5 | 4 |calendar-page-tab-day-1|   7/6 |
            |calendar-page-tab-day-2|  11/5 | 4 |calendar-page-tab-day-2|   8/6 |
            |calendar-page-tab-day-0|  9/5  | 4 |calendar-page-tab-day-1|   7/6 |
            |calendar-page-tab-day-0|  9/5  | 4 |calendar-page-tab-day-2|   8/6 |

    Scenario Outline: Moves to previous week when the button is pressed (1)
        Given I expect the "<tab1>" to be "<date1>"
        When I tap the "previous-week-button" button
        Then I expect the "<tab2>" to be "<date2>"

        Examples:
            |          tab1         | date1 |          tab2         | date2 |
            # 9/05 week
            |calendar-page-tab-day-0|  9/5  |calendar-page-tab-day-0|   2/5 |
            |calendar-page-tab-day-1|  10/5 |calendar-page-tab-day-1|   3/5 |
            |calendar-page-tab-day-2|  11/5 |calendar-page-tab-day-2|   4/5 |
            |calendar-page-tab-day-0|  9/5  |calendar-page-tab-day-1|   3/5 |
            |calendar-page-tab-day-0|  9/5  |calendar-page-tab-day-2|   4/5 |
            #16/05 week
            |calendar-page-tab-day-0|  16/5  |calendar-page-tab-day-0|  9/5 |
            |calendar-page-tab-day-1|  17/5  |calendar-page-tab-day-1| 10/5 |
            |calendar-page-tab-day-2|  18/5  |calendar-page-tab-day-2| 11/5 |
            |calendar-page-tab-day-0|  16/5  |calendar-page-tab-day-1| 10/5 |
            |calendar-page-tab-day-0|  16/5  |calendar-page-tab-day-2| 11/5 |
            #25/04 week (changes month)
            |calendar-page-tab-day-0|  25/4  |calendar-page-tab-day-0|  2/5 |
            |calendar-page-tab-day-1|  26/4  |calendar-page-tab-day-1|  3/6 |
            |calendar-page-tab-day-2|  27/4  |calendar-page-tab-day-0|  4/6 |
            |calendar-page-tab-day-0|  25/5  |calendar-page-tab-day-1|  3/6 |
            |calendar-page-tab-day-0|  25/5  |calendar-page-tab-day-2|  4/6 |

    Scenario Outline: Moves to previous week when the button is pressed (2)
        Given I expect the "<tab1>" to be "<day1>"
        When I tap the "previous-week-button" button
        Then I expect the "<tab2>" to be "<day2>"

        Examples:
            |            tab1           |  day1 |            tab2           |  day2 |
            |calendar-page-tab-weekday-0|Segunda|calendar-page-tab-weekday-0|Segunda|
            |calendar-page-tab-weekday-1| Terça |calendar-page-tab-weekday-1| Terça |
            |calendar-page-tab-weekday-2| Quarta|calendar-page-tab-weekday-2| Quarta|
            |calendar-page-tab-weekday-0|Segunda|calendar-page-tab-weekday-1| Terça |
            |calendar-page-tab-weekday-0|Segunda|calendar-page-tab-weekday-2| Quarta|

    Scenario Outline: Moves to previous week when the button is pressed (3)
        Given I expect the "<tab1>" to be "<date1>"
        When I tap the "next-week-button" button <n> times
        Then I expect the "<tab2>" to be "<date2>"

        Examples:
            |          tab1         | date1 | n |          tab2         | date2 |
            # 2 weeks
            |calendar-page-tab-day-0|  9/5  | 2 |calendar-page-tab-day-0|  25/4 |
            |calendar-page-tab-day-1|  10/5 | 2 |calendar-page-tab-day-1|  26/4 |
            |calendar-page-tab-day-2|  11/5 | 2 |calendar-page-tab-day-2|  27/4 |
            |calendar-page-tab-day-0|  9/5  | 2 |calendar-page-tab-day-1|  26/4 |
            |calendar-page-tab-day-0|  9/5  | 2 |calendar-page-tab-day-2|  27/4 |
            # 3 weeks
            |calendar-page-tab-day-0|  9/5  | 3 |calendar-page-tab-day-0|  18/4 |
            |calendar-page-tab-day-1|  10/5 | 3 |calendar-page-tab-day-1|  19/4 |
            |calendar-page-tab-day-2|  11/5 | 3 |calendar-page-tab-day-2|  20/4 |
            |calendar-page-tab-day-0|  9/5  | 3 |calendar-page-tab-day-1|  19/4 |
            |calendar-page-tab-day-0|  9/5  | 3 |calendar-page-tab-day-2|  20/4 |
            # 4 weeks
            |calendar-page-tab-day-0|  9/5  | 4 |calendar-page-tab-day-0|  11/4 |
            |calendar-page-tab-day-1|  10/5 | 4 |calendar-page-tab-day-1|  12/4 |
            |calendar-page-tab-day-2|  11/5 | 4 |calendar-page-tab-day-2|  13/4 |
            |calendar-page-tab-day-0|  9/5  | 4 |calendar-page-tab-day-1|  12/4 |
            |calendar-page-tab-day-0|  9/5  | 4 |calendar-page-tab-day-2|  13/4 |

    Scenario Outline: Both buttons are pressed (1)
        Given I expect the "<tab1>" to be "<date1>"
        When I tap the "next-week-button" button <n1> times
        And I tap the "previous-week-button" button <n2> times
        Then I expect the "<tab2>" to be "<date2>"

        Examples:
            |          tab1         | date1 | n1 | n2 |          tab2         | date2 |
            # tap next and previous once
            # 9/05 week
            |calendar-page-tab-day-0|  9/5  | 1  | 1  |calendar-page-tab-day-0|   9/5 |
            |calendar-page-tab-day-1|  10/5 | 1  | 1  |calendar-page-tab-day-1|  10/5 |
            |calendar-page-tab-day-2|  11/5 | 1  | 1  |calendar-page-tab-day-2|  11/5 |
            |calendar-page-tab-day-0|  9/5  | 1  | 1  |calendar-page-tab-day-1|  10/5 |
            |calendar-page-tab-day-0|  9/5  | 1  | 1  |calendar-page-tab-day-2|  11/5 |
            # 23/05 week
            |calendar-page-tab-day-0|  23/5 | 1  | 1  |calendar-page-tab-day-0|  23/5 |
            |calendar-page-tab-day-1|  24/5 | 1  | 1  |calendar-page-tab-day-1|  24/5 |
            |calendar-page-tab-day-2|  25/5 | 1  | 1  |calendar-page-tab-day-2|  25/5 |
            |calendar-page-tab-day-0|  23/5 | 1  | 1  |calendar-page-tab-day-1|  24/5 |
            |calendar-page-tab-day-0|  23/5 | 1  | 1  |calendar-page-tab-day-2|  25/5 |
            # tap next and previous twice
            # 9/05 week
            |calendar-page-tab-day-0|  9/5  | 2  | 2  |calendar-page-tab-day-0|   9/5 |
            |calendar-page-tab-day-1|  10/5 | 2  | 2  |calendar-page-tab-day-1|  10/5 |
            |calendar-page-tab-day-2|  11/5 | 2  | 2  |calendar-page-tab-day-2|  11/5 |
            |calendar-page-tab-day-0|  9/5  | 2  | 2  |calendar-page-tab-day-1|  10/5 |
            |calendar-page-tab-day-0|  9/5  | 2  | 2  |calendar-page-tab-day-2|  11/5 |
            # 23/05 week
            |calendar-page-tab-day-0|  23/5 | 2  | 2  |calendar-page-tab-day-0|  23/5 |
            |calendar-page-tab-day-1|  24/5 | 2  | 2  |calendar-page-tab-day-1|  24/5 |
            |calendar-page-tab-day-2|  25/5 | 2  | 2  |calendar-page-tab-day-2|  25/5 |
            |calendar-page-tab-day-0|  23/5 | 2  | 2  |calendar-page-tab-day-1|  24/5 |
            |calendar-page-tab-day-0|  23/5 | 2  | 2  |calendar-page-tab-day-2|  25/5 |
            # tap next and previous three times
            # 9/05 week
            |calendar-page-tab-day-0|  9/5  | 3  | 3  |calendar-page-tab-day-0|   9/5 |
            |calendar-page-tab-day-1|  10/5 | 3  | 3  |calendar-page-tab-day-1|  10/5 |
            |calendar-page-tab-day-2|  11/5 | 3  | 3  |calendar-page-tab-day-2|  11/5 |
            |calendar-page-tab-day-0|  9/5  | 3  | 3  |calendar-page-tab-day-1|  10/5 |
            |calendar-page-tab-day-0|  9/5  | 3  | 3  |calendar-page-tab-day-2|  11/5 |
            # 23/05 week
            |calendar-page-tab-day-0|  23/5 | 3  | 3  |calendar-page-tab-day-0|  23/5 |
            |calendar-page-tab-day-1|  24/5 | 3  | 3  |calendar-page-tab-day-1|  24/5 |
            |calendar-page-tab-day-2|  25/5 | 3  | 3  |calendar-page-tab-day-2|  25/5 |
            |calendar-page-tab-day-0|  23/5 | 3  | 3  |calendar-page-tab-day-1|  24/5 |
            |calendar-page-tab-day-0|  23/5 | 3  | 3  |calendar-page-tab-day-2|  25/5 |

    Scenario Outline: Both buttons are pressed (2)
        Given I expect the "<tab1>" to be "<date1>"
        When I tap the "next-week-button" button <n1> times
        And I tap the "previous-week-button" button <n2> times
        Then I expect the "<tab2>" to be "<date2>"

        Examples: Examples:
            |          tab1         | date1 | n1 | n2 |          tab2         | date2 |
            # tap next twice and previous once
            # 9/05 week
            |calendar-page-tab-day-0|  9/5  | 2  | 1  |calendar-page-tab-day-0|  16/5 |
            |calendar-page-tab-day-1|  10/5 | 2  | 1  |calendar-page-tab-day-1|  17/5 |
            |calendar-page-tab-day-2|  11/5 | 2  | 1  |calendar-page-tab-day-2|  18/5 |
            |calendar-page-tab-day-0|  9/5  | 2  | 1  |calendar-page-tab-day-1|  17/5 |
            |calendar-page-tab-day-0|  9/5  | 2  | 1  |calendar-page-tab-day-2|  18/5 |
            # tap next three times and previous once
            # 23/05 week
            |calendar-page-tab-day-0|  23/5 | 3  | 1  |calendar-page-tab-day-0|   6/6 |
            |calendar-page-tab-day-1|  24/5 | 3  | 1  |calendar-page-tab-day-1|   7/6 |
            |calendar-page-tab-day-2|  25/5 | 3  | 1  |calendar-page-tab-day-2|   8/6 |
            |calendar-page-tab-day-0|  23/5 | 3  | 1  |calendar-page-tab-day-1|   7/6 |
            |calendar-page-tab-day-0|  23/5 | 3  | 1  |calendar-page-tab-day-2|   8/6 |
            # tap next once and previous twice
            # 9/05 week
            |calendar-page-tab-day-0|  9/5  | 1  | 2  |calendar-page-tab-day-0|   2/5 |
            |calendar-page-tab-day-1|  10/5 | 1  | 2  |calendar-page-tab-day-1|   3/5 |
            |calendar-page-tab-day-2|  11/5 | 1  | 2  |calendar-page-tab-day-2|   4/5 |
            |calendar-page-tab-day-0|  9/5  | 1  | 2  |calendar-page-tab-day-1|   3/5 |
            |calendar-page-tab-day-0|  9/5  | 1  | 2  |calendar-page-tab-day-2|   4/5 |
            # tap next once and previous three times
            # 23/05 week
            |calendar-page-tab-day-0|  23/5  | 1  | 3  |calendar-page-tab-day-0|   9/5 |
            |calendar-page-tab-day-1|  24/5  | 1  | 3  |calendar-page-tab-day-1|  10/5 |
            |calendar-page-tab-day-2|  25/5  | 1  | 3  |calendar-page-tab-day-2|  11/5 |
            |calendar-page-tab-day-0|  23/5  | 1  | 3  |calendar-page-tab-day-1|  10/5 |
            |calendar-page-tab-day-0|  23/5  | 1  | 3  |calendar-page-tab-day-2|  11/5 |