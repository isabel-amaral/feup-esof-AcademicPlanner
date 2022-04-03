## Requirements

### Use case model

<p align="center" justify="center">
  <img src="https://github.com/LEIC-ES-2021-22/2LEIC13T3/blob/main/docs/Requirements/images/UseCaseModel.drawio.jpg"/>
</p>
<br>
<br>
<br>

**Check Schedule**

|||
| --- | --- |
| *Name* | Check schedule |
| *Actor* |  FEUP student | 
| *Description* | Check planned activities for a certain day in a certain week.  |
| *Preconditions* | - The student must be a FEUP student. <br> - The student should be logged-in and on the ‘Agenda’ page. <br> - The student must have an internet connection. |
| *Postconditions* | - The schedule is displayed on the screen. |
| *Normal flow* | 1. By default, the system shows all the activities for the current day. <br> 2. The system provides all the details of each activity (start/end time, category, frequency, etc).|
| *Alternative flows and exceptions* | 1. [Alternative display mode] The user swipes left to see the plan for the other days of the week. If the user selects the ‘Next Week’ button, the system displays the schedule of the week following the one that was being displayed, starting on Monday.|

<br>
<br>

**Add an Extra Activity**

|||
| --- | --- |
| *Name* | Add an extra activity |
| *Actor* |  FEUP student | 
| *Description* | The student has the option to add new activities beyond classes and exams, such as project deliveries, Student Branch meetings etc.  |
| *Preconditions* | - The user must be a FEUP student. <br> - The student should be logged-in and on the ‘Agenda’ page. <br> - The student must have an internet connection. <br> - There shouldn’t be any other activity on the same date and time as the new one.|
| *Postconditions* | - The calendar is refreshed to display the edits done to the activity. <br> - The database is updated to reflect the changes performed. |
| *Normal flow* | 1. The student presses the ‘create new activity’ button. <br> 2. The system displays the attributes an event can be associated with. <br> 3. The student fills the activity fields with the correct information. <br> 4. The student presses the save button <br> 5. The system saves the new activity and refreshes the calendar. <br> 6. The database is updated with the new activity.|
| *Alternative flows and exceptions* | 1. [Adding failure] If, in step 3, the hour of the new activity is the same as another that already exists, then it is not possible to add that activity and a warning is showcased. <br> 2. [Optional attributes] In step 4, the student may also enable notifications for the new event, setting how much time before it the notification should be received, and/or set a color label for the activity.|

<br>
<br>

**Delete an Activity**

|||
| --- | --- |
| *Name* | Delete an activity |
| *Actor* |  FEUP student | 
| *Description* | The student has the option to delete any activity. |
| *Preconditions* | - The user must be a FEUP student. <br> - The student should be logged-in and on the ‘Agenda’ page. <br> - The student must have an internet connection.|
| *Postconditions* | - The calendar is updated and so is the database. |
| *Normal flow* | 1. The student has the option to select an event. <br> 2. The system displays the attributes an event can be associated with. <br> 3. The student has the option to delete the event. <br> 4. The system removes the activity from the schedule and refreshes the calendar. <br> 5. The deleted activity is removed from the database.|
| *Alternative flows and exceptions* | 1. [Activities with more than one occurence] The system asks if the student wants to delete only that occurrence or all future occurrences. <br> 2. [Class/Exam Deletion] If, in step 6, the activity is either a university class or exam, it’s not really removed from the database but it becomes hidden.|

<br>
<br>


**Edit an Extra Activity**

|||
| --- | --- |
| *Name* | Edit an extra activity |
| *Actor* |  FEUP student | 
| *Description* | The student has an option to edit any activity and alter details such as its date, color label and periodicity. |
| *Preconditions* | - The student must be a FEUP student. <br> - The student should be logged-in and on the ‘Agenda’ page. <br> - The student must have an internet connection. <br> - The activity to edit isn’t a pre-marked activity (lessons and exams)|
| *Postconditions* | - The calendar is refreshed to display the edits done to the activity. <br> - The database is updated to reflect the changes performed. |
| *Normal flow* | 1. The student selects an activity to edit. <br> 2. The system displays the activity's attributes the user can edit. <br> 3. The student changes the values of the attributes. <br> 4. The student selects to save the changes made. <br> 5. The system saves and applies the edits, refreshing the calendar's display. <br> 6. The database is updated with the edits performed by the user.|
| *Alternative flows and exceptions* | 1. [Discard changes] If, in step 6, the user doesn’t choose to save their edits, these are discarded and the activity retains its previous state. The calendar isn't refreshed and the database isn’t updated either.|

<br>
<br>


**Receive Notifications**
|||
| --- | --- |
| *Name* | Receive notifications |
| *Actor* |  FEUP student | 
| *Description* | Receive notifications before an event. |
| *Preconditions* | - The student must be a FEUP student. <br> - The student should be logged-in and on the ‘Agenda’ page. <br> - The student must have an internet connection. <br> - - The student has previously enabled notifications for the event |
| *Postconditions* | |
| *Normal flow* | 1. The system sends a notification with the information about the activity that will occur soon. |
| *Alternative flows and exceptions* | |


<br>
<br>
<br>

### Domain model
<p align="center" justify="center">
  <img src="https://github.com/LEIC-ES-2021-22/2LEIC13T3/blob/main/docs/Requirements/images/DomainModel.jpg">
</p>
