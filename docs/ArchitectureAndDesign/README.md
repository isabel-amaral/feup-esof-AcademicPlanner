## Architecture and Design

### Logical Architecture
Our calendar system, on its highest level,  is composed of an **activities view**, **interacting buttons** and an **add/editing form view**.
- The activities view is the way our program shows the scheduled activities, in a timetable format.
- There are 5 main interactive buttons: “Edit event”, “Change visibility”, “Add event”, “Next week” and “Previous week”.
- The add/editing form view allows the user to fill in the information to add or edit an event


Each one of these components belongs to the **Calendar UI**, which is the interface that allows the user to interact with the calendar.
In order to make our calendar functional, there is a system called **Calendar Updating Logics**. It can be divided into 4 smaller logics modules: **Add activities logics**, **Edit activity logics**, **Delete/Hide activity logics** and **Receive notifications logics**, each one responsible for one specific type of actions.

The calendar updating logics must communicate with the Sigarra Api, which is an external API, in order to import to our calendar the activities related to classes and exams. This database will ensure that each user data is not volatile.

<p align="center" justify="center">
  <img src="https://github.com/LEIC-ES-2021-22/2LEIC13T3/blob/main/docs/ArchitectureAndDesign/images/LogicalView.jpg"/>
</p>
<br>
<br>

### Physical Architecture
Our app’s physical architecture features three entities. The user smartphone, where the app will be installed, the server, where all the information that allows the app to run will be stored and the Sigarra API, where the information concerning the student’s exams and classes will be fetched from everytime the student logs in.

Regarding the technologies, we will be using flutter because it already is the framework used in uni and is quite easy to learn. We will be using sqlite as well because of its simplicity and, given the fact we only need it to store small pieces of information that cannot be obtained directly from sigarra (information about the extra activities created by the user), it’s more than enough for our needs.


<p align="center" justify="center">
  <img src="https://github.com/LEIC-ES-2021-22/2LEIC13T3/blob/main/docs/ArchitectureAndDesign/images/PhysicalView.jpg"/>
</p>
<br>
<br>

### Vertical Prototype
For our vertical prototype we decided to implement the first draft of the Calendar page, where all our features will be functioning on later implementations.  Because our feature is based on the fact that the uni app already fetches the student’s exams and lectures from sigarra, we started the implementation using its codebase. Due to this fact, we were already able to add the student’s classes and exams to the page in order to have a clearer idea of what the UI would look like in a future date when we implement the possibility for the user to also add extra activities.

Through this prototype we were able to validate the following aspects of our logical architecture:
- Calendar UI
- Calendar Updating Logics (through the use of the Sigarra API)

and our physical architecture:
- Sigarra API (both Student’s timetable and exam schedule)
- User smartphone (by running the app using an android emulator)

and were able to have a first contact with flutter, the main technology being used for this project.


Bellow is a small clip showing what was achieved in this stage.

https://user-images.githubusercontent.com/80794891/162967652-44d9382c-9f8e-4e1e-ad41-311fdaa21d5e.mp4
