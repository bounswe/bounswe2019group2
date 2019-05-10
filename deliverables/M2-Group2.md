# Executive Summary

## Project Description
--

## Project Status
--

## Moving Forward
--


# Deliverables

| Deliverable: | Status: | Update Frequency | Description |
|--------------|---------|------------------|-------------|
| 1- GitHub Wiki | Complete | Weekly | Accessible github wiki pages, up-to-date information related to project can be found. |
| 2- GitHub Readme | Complete | As improvement needed | GitHub readme is constantly updated, includes up-to-date information about the group. |
| 3- GitHub Issues | Complete | As improvement needed | Preparing the issue labelings and usage of the github system. We update it as we need improvements. |
| 4- Meeting Notes | In Progress | Weekly | Publishing meeting notes in GitHub Wiki. All of them can be found in wiki. |
| 5- Project Plan | In progress | Complete | Preparing the project plan
| 6- API System Requirements | Complete | Complete | System requirements for the practice API
| 7- API Design Diagrams | Complete | Complete | Design diagrams for the practice API
| 8- Collaboration Workflow Documentation | Complete | As improvement needed | Usage of templates, pull request and issue templates
| 9- API Code| Complete | As improvement needed | Backend and frontend of the API
| 10- Deployed API| Complete | As improvement needed | Deployment of the API to the EC2.


**1- GitHub Wiki:** We are still in good shape in terms of github wiki. Team members are utilizing it to both keep track of the project, and demonstrate the work done. The wiki is at least weekly updated with meeting notes, in addition to that we upload whatever is done with the other assignments. Overall, the group is still good at maintaining the wiki page and utilizing it to keep everyone involved. 

**2- GitHub Readme:** Got a good explanation of the work done in the readme, that explains what we are up to. Also, the practice-app readme has the deployed app and features, how to setup, install the requirements etc.

**3- GitHub Issues:** Still we are utilizing issues well. In addition to previous labels, we added labels such as backend, devops, frontend etc. to indicate exactly what has been requested in an issue. 

**4- Meeting Notes:** We have been good at keeping meeting notes and utilizing them, and this habit of ours continues. We use the notes not only for just the sake of writing something, but keeping well intracommunication, returning the previous weeks when needed, to remember what we have discussed, etc.

**5- Project Plan:** We have struggled a bit in terms of writing a project plan that is following the instructors' opinions. It generally helped us see what's ahead of us and what we have done so far. It helped us question our workflow, and what could we do better in the next steps of the project. 

**6- API System Requirements:** The first thing we did before implementation phase was to write system requirements. We decided to provide basic investments and parity functionalities, and wrote down the requirements accordingly. Then, we used this to share the responsibilities between us. We created 10 requirement items and each member was supposed to implement one of them. We have done this to provide equal opportunity of implementation to everyone. 

**7- API Design Diagram:** We have use case diagram, class diagram and sequence diagrams. The class diagrams was almost a subset of the class diagram we did before, with minor modifications. The use case diagram and sequence diagram was also similar to the previous deliverables we have had. All in all, as usual, preparing these diagrams helped us predict and build the workflow of the API: models, methods etc. 

**8- Collaboration Workflow Documentation:** This was one of the best things we did as a team. We prepared issue templates and pull request templates. In the pull request templates, we have 2 main things, first is making sure that the author has done everything that she was supposed to do, such as adding 2 reviewers, self-reviewing and using the format(PEP8) we agreed to use, and secondly describing what is the nature and philosophy of the implementation, to let the reviewers grasp the material easier. We did the same thing with the issue templates, with the exact same purpose. Using these templates let us be on the same page using pull requests and issues system. Overall this is one of the things we consider the highlight of our group.

**9- API Code:** We used Django to implement the backend of the app, and used javascript jquery to implement the frontend. We have basically 2 family of functionalities, one is investments and the other family is parity. We provide creating, deleting, listing investments and profit calculation. We also provide listing history of parities, latest parity values. We also have register and login functionalities, secured by JWT Authentication. One thing we did good is the cron job of our backend, the job basically sends request to the API we have used(https://exchangeratesapi.io/) and updates the database accordingly. When the system is initialized, we query the API using our own-written django command to fetch the history of selected parities, then cronjob constantly updates the database with new values. Hence, the parity latest and historic endpoints can provide the information fast and robust, instead of querying another API when the request sent to us. We may even directly use these systems once we start next term, since these parts are working and solid right now.

**10- Deployed API:** TODO: yemreinci


# Evaluation of Tools and Processes Used


# Work Done by Each Member
| Team Member | Contribution / Work Done | 
| ---- | ---- | 


# API Requirements

# Project Plan


# API URL
https://api.traiders-practice.tk/doc/
https://traiders-practice.tk/


