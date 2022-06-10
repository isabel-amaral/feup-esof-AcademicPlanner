## Project Management
### Iteration #1

#### Backlog

- Start of iteration:
<p align="center" justify="center">
  <img src="Iteration%231/start.jpeg"/>
</p>

- End of iteration:
<p align="center" justify="center">
  <img src="Iteration%231/end.jpeg"/>
</p>


#### Release
[v1.0.0](https://github.com/LEIC-ES-2021-22/2LEIC13T3/releases/tag/v1.0.0)


#### Iteration Retrospective

Everything that was planned was done successfully, however it was not possible to implement unit tests.
In addition, the acceptance tests were written, however, due to a version conflict, it was not possible to execute them.
<br>
We learned to work better with flutter, which will help us in future iterations.
	

### Iteration #2

#### Backlog

- Start of iteration:
<p align="center" justify="center">
  <img src="Iteration%232/start1.jpeg"/>
</p>
<p align="center" justify="center">
  <img src="Iteration%232/start2.jpeg"/>
</p>

- End of iteration:
<p align="center" justify="center">
  <img src="Iteration%232/end1.jpeg"/>
</p>
<p align="center" justify="center">
  <img src="Iteration%232/end2.jpeg"/>
</p>


#### Release
[v2.0.0](https://github.com/LEIC-ES-2021-22/2LEIC13T3/releases/tag/v2.0.0)


#### Iteration Retrospective

Despite having planned more work items for this iteration than we did for the last one, which were also generally more time consuming, we managed to complete every task and everything seems to be working fine. Our first plan was to use Firebase as a way to store each user’s activities, however we had a lot of trouble fetching the information correctly and save it locally for display so, after meeting with the class’s monitors, we decided to ditch the idea. The short term solution found was to just have a class with some initial hardcoded activities, this isn’t a good solution since it doesn’t allow the activities to be user specific or to be kept after logging out, but was a good enough foundation for us to be able to complete the remaining work items. 
<br>
Because of the technical problems with both firebase and running the acceptance tests we didn’t have the time, once again, to test our features appropriately. Nonetheless we will make testing one of our primary focus areas for the next iteration.


### Iteration #3

#### Backlog

- Start of iteration:
<p align="center" justify="center">
  <img src="Iteration%233/start1.jpeg"/>
</p>
<p align="center" justify="center">
  <img src="Iteration%233/start2.jpeg"/>
</p>

- End of iteration:
<p align="center" justify="center">
  <img src="Iteration%233/end.jpeg"/>
</p>


#### Release
[v3.0.0](https://github.com/LEIC-ES-2021-22/2LEIC13T3/releases/tag/v3.0.0)


#### Iteration Retrospective

For this iteration we focused in finishing our last important user stories: editing, deleting activities and changing lectures' and exams' visibility.
These were the last tasks needed to make our page functional and intuitive to use.
<br>
When first planning our work we thought of including an extra feature that would allow the user to receive notifications for the events they would want to subscribe.
Since it was a secondary feature, we ended up not implementing it.
<br>
Aditionally, after the last iteration we came to the conclusion that it didn't make much sense to not allow activities sobreposition.
However, we ended up not being able to correct this logics.
<br>
Finally, we were able to implement acceptance tests for a number of our features, something that wasn't done for the previous iterations.
Unfortunately we didn't get to do any unit tests, partly because we had no time for this task and also partly because we spent a lot of time improving or knowledge in acceptance testing.