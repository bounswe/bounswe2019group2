# Table of Contents

<!-- toc -->

- [Executive Summary](#executive-summary)
  * [Project Description](#project-description)
  * [Project Status](#project-status)
  * [Moving Forward](#moving-forward)
- [Deliverables](#deliverables)
- [Work Done by Each Member](#work-done-by-each-member)
    + [Group Members](#group-members)
    + [Customers](#customers)
- [Annotation Implementation](#annotation-implementation)
- [Requirements](#requirements)
  * [Table of Contents - Requirements](#table-of-contents---requirements)
  * [Glossary](#glossary)
  * [1. Functional Requirements](#1-functional-requirements)
    + [1.1. User Requirements](#11-user-requirements)
    + [1.2. System Requirements](#12-system-requirements)
  * [2. Non-Functional Requirements](#2-non-functional-requirements)
    + [2.1. Security](#21-security)
    + [2.2. Performance](#22-performance)
    + [2.3. Availability and Accessibility](#23-availability-and-accessibility)
    + [2.4. Annotations](#24-annotations)
- [User Scenarios](#user-scenarios)
  * [Scenario 1 (Mobile)](#scenario-1-mobile)
    + [John  Wick](#john-wick)
  * [Scenario 2 (Web)](#scenario-2-web)
    + [Can Özcan](#can-özcan)
  * [Scenario 3 (Web)](#scenario-3-web)
    + [Enes Yılmaz ](#enes-yılmaz)
- [Evaluation of tools and managing the project](#evaluation-of-tools-and-managing-the-project)
  * [Backend](#backend)
  * [Frontend](#frontend)
  * [Mobile](#mobile)
- [Design Documents](#design-documents)
- [System Manual](#system-manual)
- [User Manual](#user-manual)
- [API Documentation](#api-documentation)
- [Annotation API Documentation](#annotation-api-documentation)

<!-- tocstop -->

# Project Assesment
## Teamwork
This one year long journey was particularly a teaching and enjoyable experience for us. <br>
Starting in CMPE352, most of the group members did not know each other, yet the group got to know each other very quickly and adapted to working as a team. <br>
Throughout the project, everyone had busy periods in their schedules, but the team managed to fill in for that person, and that person also compensated for that period at a later time.  <br>
Moreover, at the beginning of CMPE451, there were people leaving and joining, but the team handled the transition very smoothly. <br>
To sum up, Group 2 as a team managed to start from zero and became an actual embodiment of teamwork.
<br> 
## Technical Skills
At the beginning of CMPE352, few of us had web development experience, let alone specialization in a topic. <br>
There were a few of us who had the knowledge of backend, mobile, and frontend, and from time to time we had tutorial sessions in the team. <br>
At the end of CMPE451, all of the group contributed to the application, some of us learning the frameworks from knowing nothing and being able to come up with the desired product. <br>
The least of all, every group member became better at some aspect of web development. <br>
## Customer Interaction
One of the things the Group 2 did the best is probably interacting with the customer. <br>
We, as a team, know that we could enhance different aspects of the final product further, but knowing that we have a limited budget in terms of time and workforce, <br>
we managed the customer expectation and delivered almost all of the requirements just in time. <br>
We were careful enough to look out for the borders that were drawn by the customers, in terms of time, product, deliverables and further. <br>
One of the things the process thought us is: It is very important to deliver what is being asked for: Nothing more is required, nothing less is acceptable. <br>

## Final Product
At the end of the day, the experience we had and learnings along the journey led to our investment platform, **TrAiders**. <br>
In terms of specialty, we have learned new things in economics and the investment world. The final product has all the functionalities being asked for in the requirements. <br>
Users can make investments, track their investments, track the economic state in the parities, can read comments and articles, can follow events and interact with other users through different media. <br>
The system also has <text, image> to <text,image> annotations, which is using the W3C protocol, and that system running on a different server as well. <br>

## Final Comments
One of the very important lessons that the process thought us is attention to detail. <br>
Simply just by paying attention to customer's words or what is written on the paper can lead to great satisfaction. <br>
One can find these details in any part of the TrAiders product: The avatars, the ease of use for the users, the annotation system being run exactly by the customer's description. <br>
We, as Group 2 are very happy with the final product that we have, but most importantly the teamwork and friendship we have built throughout the journey, and everyone having value added to their lives. <br>

# Deliverables

| Deliverable:                     | Status:     | Update Frequency      | Description                                                                           |
| -------------------------------- | ----------- | --------------------- | ------------------------------------------------------------------------------------- |
| 1- GitHub Wiki                   | Complete    | Weekly                | Accessible github wiki pages, up-to-date information related to project can be found. |
| 2- GitHub Issues & Pull Requests | Complete    | As improvement needed | Issue labels, templates, workflow.                                                    |
| 3- Meeting Notes                 | Complete | Weekly                | Publishing meeting notes in GitHub Wiki.                                              |
| 4- Requirements                  | Complete    | As improvement needed | Sharing the requirements analysis related to the project. Updating as needed.        |
| 5- Mockups                       | Complete    | As improvement needed | To stay on the same page with the customer.                                           |
| 6- Design Diagrams               | Complete    | Per feedback for now  | Posting design diagrams to wiki page                                                  |
| 7- Project Plan                  | Complete | -                     | Preparing the project plan                                                            |
| 8- API                           | Complete | Weekly                | Backend of the project. Related endpoints, management of DB etc.                      |
| 9- API Documentation             | Complete | As improvement needed | API Documentation for the users of endpoints.                                         |
| 10- Deployment and Security      | Complete | As improvement needed | Deployment of the project and accessibility                                            |
| 11- Web Project, Frontend        | Complete | Weekly                | Frontend project and accessibility                                                     |
| 12- Mobile App                   | Complete | Weekly                | Mobile application and accessibility                                                   |
| 13- Weekly Milestones                   | Complete | Weekly                | To increase efficiency and throughput in delivery |
| 14- System Manual                   | Complete | As needed                | Describes system requirements and deployment process|
| 15- User Manaul                   | Complete | As needed                | Instructs how users can start using & utilize the system |
| 16- Annotation Model                   | Complete | As update needed                | Demonstrate the implemented data annotation Model |

**1- GitHub Wiki:**
We are updating our wiki page as needed, pushing meeting notes and keeping everything from requirements to group members updated on there.

**2- GitHub Issues & PRs:**
We still use our previous convention. All can be traced in the repo. Everyone creates their own issue, people should not be closing their issue without the review of at least 2 other people, preferably from the same team. Issue Templates and PR templates are used during the creation. As a new thing, we left using Travis as our continuous integration tool and we started to use GitHub Actions.

**3- Meeting Notes:**
Meeting notes are still accessible through the wiki page.
We are always utilizing those to refer to action items, remember our agenda and goals.

**4- Requirements:**
We have rarely updated our requirements so far, but we always keep reviewing them during the implementation phase.

**5- Mockups:**
You can visit the [mockups section](https://github.com/bounswe/bounswe2019group2/wiki/Mockups) to see all the mockups we've done so far.

**6- Design Diagrams:**
We finalized the implementation, but there will still be updates as needed. Final version of the class diagrams can be found at this page [page](https://github.com/bounswe/bounswe2019group2/wiki/Class-Diagram). 

**7- Project Plan:**
Project plan can also be found below. As mentioned previously, we have decided to take a requirement oriented approach.
Thus in the project plan, the tabs refer to our requirements. Each week we plan to implement a couple of those.

**8- API:**
Traiders API can be accessed at [api.traiders.tk](//api.traiders.tk). 

**9- API Documentation:**
Traiders API documentations can be accessed at [api.traiders.tk/docs](//api.traiders.tk/docs) [api.traiders.tk/redocs](//api.traiders.tk/redocs)

**10- Deployment and Security:**
We frequently deployed our application's latest version throughout the development process so that it would always be up to date. In addition to that we deployed an annotation server to bring annotation support to our application. Annotation server is independent from Traiders servers and can be accessed at [https://annotation.traiders.tk/](//annotation.traiders.tk/).

**11- Web Project, Frontend:**
Our web application is up and running at [traiders.tk](//traiders.tk). Users can register, sign in, choose an avatar, list & view & like & comment (on) articles, list & tracks events, list & follow users, list & view & comment (on) equipment, list & see details with charts for several parities in different category, add assets, make investments, create & follow portfolios, making text or image annotations for articles, sign-up or sign-in with Google, make semantic search. get recommendations, see notifications, 


**12- Mobile App:**
The latest version of our mobile application will always be downloadable at [traiders.tk/mobile](//traiders.tk/mobile).
Users can register, sign in, choose an avatar, list & view & like & comment (on) articles, list & track events, list & follow users, list & view & comment (on) equipment, list & see details for several parities in different category, sign-up or sign-in with Google,  create & delete alarms, create & list portfolios, make semantic search, get recommendations, see notifications, make text to text annotations for articles.

**13- Weekly Milestones:**
We continued to utilize milestone concept. As stated previously we tried to set weekly or biweekly custom milestones to increase efficiency in delivery and ease the management of the project per domain like backend, frontend, etc.

**14- System Manual:**
A system manual has been prepared to show how to deploy the application as both backend and frontend and it lists the requirements needed to be satisfied.

**15- User Manual:**
A user manual has been prepared to instruct users how they can start using the application. It explains the important functionalities of the application and tells how a user can use these functionalities in a step by step manner.

**16- Annotation Model:**
An document has been prepared to demonstrate how we foollowed the Web Annotation Data Model during the implmentation of annotation functionality.


# Work Done by Each Member

### Group Members
- Alperen Kürşat Özkan
- Fatih İver
- Harun Eren
- Mert Yüksekgönül
- Muhammet Furkan Gök
- Özgür Solak
- Rukiye Dilruba Köse
- Yunus Emre İnci(Communicator)

### Customers
- Suzan Uskudarli
- Alper Ahmetoğlu

Team | Member | Work done    |
| -------- | ------- | ----------- |
| *Backend* | **Yunus Emre Inci** | • Implemented user related API endpoints. (register, update, delete, retrieve) <br> • Implemented authentication and permission mechanisms. (token creation) <br> • Added location information for users. <br> • Handled DevOps related stuff. Deployment, server and database configurations etc. <br> • Updated class diagram due to changes in design. <br> • Implemented functionality for fetching live and historic parity data from AlphaVantage. <br> • Added OpenIBAN support for IBAN validation. <br> • Configured Github actions for CI. <br> • Implemented API endpoints for login and register by Google. <br> • Implemented the annotation server which complies to W3C standards. <br> • Fixed various errors and reported bugs. <br> • Added unit tests for implemented API endpoints.   <br> • Reviewed other team members' work. |
| *Backend* | **Harun Eren**  |  • Implemented Article endpoint (create, delete, retrieve, list, update) <br> • Implemented Like endpoints (create, delete, retrieve) <br> • Implemented unit-tests for Article and Like endpoints <br> • Updated project plan according to requirements <br> • Implemented Equipment-Pair model for Portfolio <br> • Implemented Portfolio API and unit-tests <br> • Notification (for Event, Article, BuyOrder, StopLossOrder) API and Tests <br> • Alert API, Notification(for Parity Alert) and Tests <br> • Code review and maintenance (bug fixes, updates endpoints for new endpoints, update documentation etc) |
| *Backend* | **Mert Yuksekgonul** | •  Implemented Prediction endpoint. <br> • Implemented Events Endpoint. <br> • Implemented success rate endpoints. <br> • Implemented evaluation of the prediction results after the closure of the day. <br> • Implemented manual investments endpoints. <br> • Implemented online investments. <br> • Implemented assets of a user. <br> • Implemented signals for asset updates after an online investment. <br> • Implemented orders(buy order, stop/loss order). <br> • Implemented realization of orders after the related parity updated. <br> • Implemented profit/loss endpoints. <br> • Implemented comment likes and event following. <br> • Implemented tests for orders and investments, comment likes, parity/latest endpoint. <br> Code review and maintenance(bugfixes, updates for endpoint) for backend. <br>|
| *Frontend* | **Dilruba Köse** | • Implement footer component <br>   • Implement user profile page <br>  • Implement UserHeader component <br> • Implement OtherUser component for controlling following functionality <br>   • Update profile page, for both current and other users and configure routing  <br>  • Implement UserSuccess component for prediction success table <br>  • Implement ParityChart Component <br>  • Implement Parity Page and configure routing <br>  • Implement Equipment Page and configure routing <br>   • Fix bugs in user pages and implement prediction in parity page. <br>  • Implement Recommendation Page and configure routing <br>  • Implement Notifications in user page and in navbar component. <br>  • Made reviews for web-front-end team commits. <br> • Attended front-end team code sessions. <br> |
| *Frontend* | **Muhammet Furkan Gök** |  • Initialized frontend proeject.(Bootstrapped a react project by npm) <br>   • Added Airbnb JavaScript styleguide to the project <br> • Attended front-end team code sessions. <br>  • Made reviews for web-front-end team commits. <br> • Added react-redux and router the project. <br> • Implemented Home page and Currency Bar components <br> • Prepared base connection between server and the web-site. <br>  • Implemented article page with edit-delete-create functionalities <br> • Implemented custom table for displaying parities and equipments on different pages <br> • Implemented orders component <br> • Implemented investments component <br> • Implemented assets component <br> • Implemented socials page displaying articles and events on two different tabs respectively <br> • Implemented a component showing initial details about an article to be used in home page and socials page <br> •  Attended front-end team coding sessions <br> • Made reviews on the pull requests of other front end team members <br> • Implemented text and image annotation for article page <br>  • Some bug fixes (details are included in commit messages)  |
| *Frontend* | **Alperen Kürşat Özkan** |  • Bugfix on investment and route handling of notifications <br>   • Implement Event Follow Functionality   <br>  •Bugfix on Investment Page <br>  • Implementing total profit on investment page  <br>  • Made reviews for web-front-end team commits.  •Adding Follow functionality on Event Page <br>   • Bugfix rendering issue on article comments when article is liked  <br>   •Add Portfolio screen to user's profile readjust and bugfix on functionality of buttons <br> • Bugfix on re-rendering upon Adding new portfolio / portfolio item on My portfolios and Followed Portfolios <br> • Frontend Google Sign in button and Backend Connections. <br> •Implementation of owned Portfolios page on Frontend  <br> • Implementation of followed portfolios page and follow-delete-add functionality handling.  <br> •Comment like functionality backend connections has completed. <br> •Bugfix setting notification request timer to avoid 10000 notifications in minutes.  <br>  • Implemented CommentContainer component <br>   • Implemented Geolocation for Map Component  <br> • Attended front-end team code sessions. <br>  •Implemented Map Component. <br>  • Implemented autolocation search functionality.   <br>  • Implement Comment component on article <br>   • Update on map component and location style issues   <br> • Attended front-end team code sessions. <br>  •Implementing Create Comment Component - Add Edit- Delete comment functionalities <br>  • Add logo to home page and configure home routing.    • Add iban - password validations on register page <br>   • Add is Trader functionality on register page , bug fix on registration <br>   • Add Like Article Functionality <br> • Frontend comment avatar logo addition <br> • Frontend/bugfix on Delete comment equipment and re-rendering issues on comment both on article and comment on delete. <br> • Frontend/bugfix on Delete comment equipment and re-rendering issues on comment both on article and comment on delete. <br> • Frontend/bugfix related to follow / like buttons - Comment Add <br> • Implement Frontend/portfolio page basics.|
| *Mobile* | **Fatih İver** | • Implement portfolio add, delete, edit & list <br> • Implement asset add & delete <br> • Implement article annotation <br> • Implement search <br> • Implement recommendations <br> • Implement notifications <br> • Implement alarm add, delete, edit & list  <br> |
| *Mobile* | **Ozgur Solak**  | • Implement Stock Fragment  <br> • Implement Comment component on article <br> • Create Milestone Personna for Mobile Scenario <br> • Implement Crypto Fragment <br> • Implement write article functionality <br> • Add write article button to access from home page <br> • Implement Currency  Fragment basics <br> • Implement Metal Fragment Basics <br> • Implement Index  Fragment basics <br>  • Implement Google  Sign-in  <br>  • Implement displaying Success Rate on user profile <br>  • Implement changing profile mode  <br> |

# Annotation Implementation

TrAiders Web Annotation Server partially implements 
W3C [Web Annotation Data Model](https://www.w3.org/TR/annotation-model/) and 
[Web Annotation Protocol](https://www.w3.org/TR/annotation-model/). It supports text and image annotation bodies 
for both text and image targets with fragment selectors. This document gives examples on how a client can retrieve and create annotations.

## Annotation Retrieval
TrAiders Web Annotation Server provides a single annotation container available at [https://annotation.traiders.tk/annotations/](https://annotation.traiders.tk/annotations/).
`GET` requests to this endpoint returns the list of existing annotations.
### Example
#### Request
```http
GET https://annotation.traiders.tk/annotations/
```   
#### Response
```json
[
    {
      "@context": "http://www.w3.org/ns/anno.jsonld",
      "id": "https://annotation.traiders.tk/annotations/80/",
      "type": "Annotation",
      "created": "2019-12-24T14:11:35.995189Z",
      "body": {
        "type": "TextualBody",
        "value": "The IOTA Tangle is a stream of interlinked and individual transactions. These transactions are distributed and stored across a decentralised network of participants."
      },
      "target": {
        "source": "https://api.traiders.tk/articles/132/",
        "selector": {
          "type": "FragmentSelector",
          "value": "char=158,176"
        }
      },
      "creator": "https://api.traiders.tk/users/545/"
    },
    {
      "@context": "http://www.w3.org/ns/anno.jsonld",
      "id": "https://annotation.traiders.tk/annotations/85/",
      "type": "Annotation",
      "created": "2019-12-24T16:09:26.328396Z",
      "body": {
        "type": "TextualBody",
        "value": "I like this!"
      },
      "target": {
        "source": "https://media.traiders.tk/img2.jpg",
        "selector": {
          "type": "FragmentSelector",
          "value": "xywh=39.53,38.96,31.88,26.04"
        }
      },
      "creator": "https://api.traiders.tk/users/546/"
    }
]
```
Two examples of textual annotations bodies that were targeted to article image and texts are listed above.

## Annotation Creation
Annotation are created by sending a `POST` request to the annotation server.
If the creation succeeds, the server returns the newly created annotation.
### Example
Creation of an example annotation with a text target and image body:
#### Request
```http
POST https://annotation.traiders.tk/annotations/

{
    "body": {
        "type": "Image",
        "id": "http://example.org/image.png"
    },
    "target": {
        "source": "https://traiders.tk/articles/5",
        "selector": {
            "value": "char=10,20"
        }
    }
}
```
#### Response
```json
{
  "@context": "http://www.w3.org/ns/anno.jsonld",
  "id": "https://annotation.traiders.tk/annotations/23/",
  "type": "Annotation",
  "created": "2019-12-25T16:09:26.328396Z",
  "body": {
    "type": "Image",
    "id": "http://example.org/image.png"
  },
  "target": {
    "source": "https://traiders.tk/articles/5",
      "selector": {
      "value": "char=10,20"
    }
  }
}
```

## Fragment Selection
TrAiders Web Annotation Server supports fragment selectors for both image and text targets.
### Text Fragment Selection
W3C convention for selecting text fragments can be used. For example, a fragment selector with the value of `char=50,100` 
would mean the substring of the text starting from 50th character to 100th was targeted for annotation.
### Image Fragment Selection
Image fragment selection works similarly. A fragment selector with the value of `xywh=10,15,30,35` will target the 
rectangle of size 30x35 with its top left corner on the pixel (10, 15). 

## Limitations
TrAiders Web Annotation Server only implements annotations with image and text bodies targeted to image and text bodies.
It does not support other multimedia types such as video and audio. Annotations are limited to only a single body and target. Multiple targets or bodies are not supported.

# Requirements

## Table of Contents - Requirements

 * [Glossary](#glossary)
   * [1. Functional Requirements](#1-functional-requirements)
      * [1.1. User Requirements](#11-user-requirements)
         * [1.1.1. Sign Up](#111-sign-up)
         * [1.1.2. Sign In](#112-sign-in)
         * [1.1.3. Profile](#113-profile)
         * [1.1.4. Social Interactions and Communication](#114-social-interactions-and-communication)
         * [1.1.5. Economic Events](#115-economic-events)
         * [1.1.6. Portfolios](#116-portfolios)
         * [1.1.7. Trading Equipment and Parities](#117-trading-equipment-and-parities)
         * [1.1.8. Investments](#118-investments)
         * [1.1.9. Profit/Loss](#119-profitloss)
         * [1.1.10. Search](#1110-search)
         * [1.1.11. Recommendations](#1111-recommendations)
         * [1.1.12. Admin Panel](#1112-admin-panel)
      * [1.2. System Requirements](#12-system-requirements)
         * [1.2.1. Interactions](#121-interactions)
         * [1.2.2. Recommendation](#122-recommendation)
         * [1.2.3. Searching](#123-searching)
         * [1.2.4. Trading Equipments and Parities](#124-trading-equipments-and-parities)
   * [2. Non-Functional Requirements](#2-non-functional-requirements)
      * [2.1. Security](#21-security)
      * [2.2. Performance](#22-performance)
      * [2.3. Availability and Accessibility](#23-availability-and-accessibility)
      * [2.4. Annotations](#24-annotations)

## Glossary
Note: Aliases for terms are given in parentheses.

* **Admin User:** An administrative user who can ban users and manage contents such as parities, articles, comments and economic events.
* **Annotation:** A note or comment typically used to convey information about a resource or associations between resources. For example a comment or a tag on a single web page or image. 
* **Article:** A piece of writing of users about trading and investment. Articles have a title and meant to be somewhat longer.
* **Asset:** Assets describe investments of trading users which are physically held in the platform. 
* **Basic User:** A basic user is a user who can use all the functionality of the system other than making real investments.
* **Comment:** Comments can be written below articles and trading equipments by users to share their ideas.
* **Economic Event (Event):** Economic events are important incidents that may effect the economy, such as a publication of a statistic. An event's importance level designated with an integer from 1 to 3. 
* **Guest:** A user who is using the platform but has not signed up yet. 
* **Investment:** Two types of investments exists in the platform. One is the type of investments that are manually entered by users, and other is the assets that are physically held in the platform. 
* **Parity:** A pair of trading equipments. Parities describe a valid conversion from one equipment type to another.
* **Password:** A string of characters that allows access to the system. Passwords are at least 8 characters long, can include letters, digits and special characters.
* **Portfolio:** A collection of parities the user selects to follow them together.
* **Sign up:** Registering to the system by providing an e-mail address, name, surname, location and choosing a password. 
* **Trading equipment (Equipment):** Any valuable in which users can invest, such as: indices, stocks, ETFs, commodities, currencies, funds, bonds and cryptocurrencies. A trading equipment does not have a price by itself, price of equipments are only existent within a parity.
* **Trading User (Trader):**  In addition to basic users' functionalities, trading users are able to buy and sell trading equipment on the platform.



## 1. Functional Requirements

### 1.1. User Requirements

Before getting into user requirements it is necessary to define different user types of the system. The system has 4 types of users: **Guest**, **Basic User**, **Trading User (Trader)** and **Admin**. The roles of these user types are briefly explained in the [glossary](#glossary) and will be defined explicitly throughout the following requirements.

In this section, the word "user" will refer to any user of types **Basic User**, **Trader** or **Admin**. The words "guest", "trader" or "admin" will be used when a requirement is specific to only one type of user.

The reader is highly encouraged to read the [glossary](#glossary) before reading the requirements as the meanings of terms used in this document might differ from the common knowledge. The reader may also visit [[User Types]] to see a summary of "who can do what".

#### 1.1.1. Sign Up
  * **1.1.1.1.** Guests shall be able to sign up by providing their e-mail address, name, surname, location and choosing a [password](#glossary). If the guests wants to register as a trading user, they shall also provide [IBAN](https://en.wikipedia.org/wiki/International_Bank_Account_Number) of their bank account. Location information shall be given using Google Maps. 

  * **1.1.1.2.** Guests should be able to sign up with their Google account. 

#### 1.1.2. Sign In
  * **1.1.2.1.** Users shall be able to sign in with their e-mail and password.
  * **1.1.2.2.** Users should be able to sign in with their Google account.

#### 1.1.3. Profile
  * **1.1.3.1.** Each user shall have a profile page.
  * **1.1.3.2.** Users' prediction success rate for each parity shall be visible on their profile page. There should be a lower limit to the number of predictions for the success rate to be visible on the profile page.
  * **1.1.3.3.** Users' portfolios shall be shown on their profile page.
  * **1.1.3.4.** Users shall be able to set their profile to be public or private.
  * **1.1.3.5.** Public profiles shall be visible to all users and guests. 
  * **1.1.3.6.** If a user profile is private, then the content produced by that user shall only be visible to its followers.
  * **1.1.3.7.** Prediction success rate shall be visible to all users and guests even if a user's profile is private.

#### 1.1.4. Social Interactions and Communication
  * **1.1.4.1.** Users shall be able to follow each other. To follow a user who set his profile to be private, a follow request shall be sent first.
  * **1.1.4.2.** Users shall be able to deny the following requests came from other users. 
  * **1.1.4.3.** Users shall be able to share their ideas as an article.
  * **1.1.4.4.** Users shall be able to write comments below the articles of other users.
  * **1.1.4.5.** Users shall be able to rate articles of other users by clicking the "like" button.
  * **1.1.4.6.** Users shall be able to write comments about trading equipment. 

#### 1.1.5. Economic Events
  * **1.1.5.1.** Users and guests shall have an “Events” section. In this section, users and guests shall be able to view economic events as a table with columns: 'time', 'importance level', 'country base', 'actual', 'previous' and 'forecast'. [See example](https://www.investing.com/economic-calendar/).
  * **1.1.5.2.** Users and guests should be able to filter economic events by their importance level and country base.
  * **1.1.5.3.** Users and guests should be able to search for economic events.
  * **1.1.5.4.** Users shall be able to follow economic events. A user who is following an event should be notified after the event happened.

#### 1.1.6. Portfolios
  * **1.1.6.1.** Users shall have one or more portfolios. Empty portfolios may exist.
  * **1.1.6.2.** Users shall be able to rename their portfolios.
  * **1.1.6.3.** Users shall be able to add or remove parities from their portfolios.
  * **1.1.6.4.** Users shall be able to follow each other's portfolios. Followed portfolios shall be shown in user's portfolios section.

#### 1.1.7. Trading Equipment and Parities
  * **1.1.7.1.** Users and guests shall be able to view conversion ratio, previous close, percentage and amount change according to the previous close, day's range and moving averages for a parity.
  * **1.1.7.2.** Users and guests shall be able to read user comments about trading equipment.
  * **1.1.7.3.** Users shall be able to make predictions about the parities for the day. A prediction shall be either "will increase" or "will decrease". The result of the prediction is determined by comparing the last close and today's close of the ratio. 
  * **1.1.7.4.** Users shall be able to set alerts for certain ratios of parities. Users shall be notified when the target ratio is met.

#### 1.1.8. Investments
  * **1.1.8.1.** Users shall have a "My Investments" section which contains information about their assets that are physically held in the platform and also manual investments which they made outside of the platform. 
  * **1.1.8.2.** Users shall be able to enter manual investments.
  * **1.1.8.3.** Traders and basic users shall have to verify their e-mail address before making an investment.
  * **1.1.8.4.** Traders shall be able to buy trading equipment by selling another equipment from their assets if a conversion exists between those equipments.  For example, a trader could sell Turkish liras (TRY) to buy United States dollars (USD) whereas he couldn't directly convert his golds to Apple stocks because such a conversion does not exist.
  * **1.1.8.5.** Traders shall also have an option of paying with a credit card instead of selling their assets when making an investment.
  * **1.1.8.6.** Traders shall be able to give buy orders for a desired ratio. When the current price goes below the desired ratio, the system shall make the buy automatically.
  * **1.1.8.7.** Traders shall be able to give stop/loss orders by specifying a maximum loss. The system shall automatically reverse the investment when the amount of lost goes above the maximum loss.

#### 1.1.9. Profit/Loss
  * **1.1.9.1.** Users shall have a profit/loss section. They shall be able to see their profit/loss amount in the currency of their choice. Users' manual investments and assets shall be both accounted when calculating their profit/loss.
  * **1.1.9.2.** Users and guests shall not be able to see the profit/loss of other users.

#### 1.1.10. Search
  * **1.1.10.1.** Users and guests shall be able to search for trading equipment, parities and other users. The search algorithm shall consider all information available in user profiles (such as portfolios) and shall retrieve semantically similar results to the query.
  * **1.1.10.2.** Users and guests shall be able to filter users around a location when searching.

#### 1.1.11. Recommendations
  * **1.1.11.1.** Users shall receive article and trading equipment recommendations based on their investments, users and events they follow.

#### 1.1.12. Admin Panel
   * **1.1.12.1.** Admins shall have an admin panel to administrate the platform.
   * **1.1.12.2.** Admins shall be able to add new trading equipment and parities.
   * **1.1.12.3.** Admins shall be able to ban or delete users. Banned users shall not be able to sign in.
   * **1.1.12.4.** Admins shall be able to delete articles and comments.
   * **1.1.12.5.** Admins shall be able to add or delete events.

### 1.2. System Requirements

#### 1.2.1. Interactions
   * **1.2.1.1.** The system shall support sharing ideas as an article.
   * **1.2.1.2.** The system shall support commenting and rating ideas of other users.
   * **1.2.1.3.** The system shall support commenting about trading equipment.
   * **1.2.1.4.** The system shall let users follow other users and trading equipment.
   * **1.2.1.5.** The system shall provide an alert mechanism which lets traders to get notified about certain levels of trading equipment.
   * **1.2.1.6.** The system shall provide an alert mechanism which lets users to get notified about other users activities, when they follow another user.

#### 1.2.2. Recommendation
   * **1.2.2.1.** The system shall provide a recommendation mechanism recommending articles, portfolio or trading equipment to the users based on their histories.
   * **1.2.2.2.** The system shall let users to make predictions about trading equipment.

#### 1.2.3. Searching
   * **1.2.3.1.** The system shall contain a searching mechanism that lets users to search users, trading equipment and economic events.
   * **1.2.3.2.** The searching mechanism shall consider all the information available in user profiles and trading equipment.
   * **1.2.3.3.** The system shall allow the semantic search which enables users to make a search by using user defined tags in order to make more specific search.
   * **1.2.3.4.** The system shall support location-based search.

#### 1.2.4. Trading Equipments and Parities
The system shall support following equipments and possible conversions between them:
  * **1.2.4.1.** Trade indices such as S&P 500, Dow 30, DAX...
  * **1.2.4.2.** Stocks such as Apple, Alibaba, IBM...
  * **1.2.4.3.** ETFs such as SPDR S&P 500, SPDR DJIA, iShares Russel 2000...
  * **1.2.4.4.** Commodities such as Gold, Natural Gas, Silver...
  * **1.2.4.5.**  The application should support chief monetary units in the world. Currencies such as Euro, American Dollar, Turkish Lira...
  * **1.2.4.6.** Funds such as Pimko Total Return, Vanguard Total Stock Market Index Fund, American Funds Growth Fund of America...
  * **1.2.4.7.** Bonds such as Euro Bund, UK Gild, Japan Government Bond...
  * **1.2.4.8.** Cryptocurrencies such as Bitcoin, Ethereum, XRP...


## 2. Non-Functional Requirements 

### 2.1. Security
  * **2.1.1.** The website and the mobile application shall use secure HTTP ([HTTPS](https://en.wikipedia.org/wiki/HTTPS)) for all transfers.
  * **2.1.2.** The website shall be secure against [SQL injection](https://en.wikipedia.org/wiki/SQL_injection), [cross-site scripting](https://en.wikipedia.org/wiki/Cross-site_scripting), and [cross-site request forgery](https://en.wikipedia.org/wiki/Cross-site_request_forgery) attacks.
  * **2.1.3.** User passwords shall be stored in the database using a secure hashing algorithm.
  * **2.1.4.** The system should backup weekly.

### 2.2. Performance
   * **2.2.1.** The system shall be able to handle 1000 HTTP requests per second.
   * **2.2.2.** The system shall be capable of serving 1000 users at the same time.
   * **2.2.3.** The system shall respond to search queries in less than 3 seconds.

### 2.3. Availability and Accessibility
   * **2.3.1.** The website and the mobile application shall be available in English.
   * **2.3.2.** The project should work on Safari 10 and above, Chrome 70 and above, Opera 60 and above, Firefox 60 and above.
   * **2.3.3.** The application shall work on Android 4.4 and later.
   * **2.3.4.** The project shall be provided for both mobile and web platforms.
   * **2.3.5.** The system should work 7/24 with no more than 1% downtime.
   * **2.3.6.** The project should contain auxiliary features for disabled people.
   * **2.3.7.** The system shall use [UTF-8](https://en.wikipedia.org/wiki/UTF-8) character encoding for all texts.

### 2.4. Annotations
   * **2.4.1.** The [W3C Web Annotation Data Model](https://www.w3.org/TR/annotation-model/) and [W3C Web Annotation Protocol](https://www.w3.org/TR/annotation-protocol/) shall be used for annotations.


# User Scenarios
## Scenario 1 (Mobile)
### John  Wick
![John Wick](https://github.com/bounswe/bounswe2019group2/blob/documentation/final-report/deliverables/images/johnwick.png?raw=true)

**Persona**
* 58 years old
* Closer to retirement.
* Worked at a bank.
* Very ambitious and curious about Bitcoin

**Story**
* He signed in to our mobile app and noticed that he chose the wrong avatar. 
* He changes the avatar to be an old man.
* He set an alert for Bitcoin. He goes to the Alerts tab to set another alert for Bitcoin because he does not want   to miss   any critical level updates. He sets another alert.  
* Then goes to the notification tab to see is there any other notification for him. 
* He goes to the search tab to search for Bitcoin, and by doing that he wants to see the latest updates about it.
* He sees an article in the search results. He clicks to that article to view its full version. He reads the article, learns that IOTA value is decreasing.
* He sees a few annotations made by other users. He click them to read what is written.
* He also wants to add his own annotation because halving is coming and everybody should know about it, commenting wouldn’t be enough.
* He annotates by selecting the Bitcoin word. He then leaves the article.
* He goes to the portfolio tab to make some changes. He removes IOTA from his crypto portfolio. He also deletes his stock portfolio because they are kind of boring, compared to crypto market. 
 
**Preconditions**
1. Uses a our mobile app.
2. Already has an account.
3. Already has a verified e-mail.
4. Already set an alert
5. Already tracked several events.

**Acceptance Criteria**
1. 1.1.2.1
2. 1.1.3.1
3. 1.1.4.3  1.1.4.5
4. 1.2.1.1, 1.2.1.2
5. 1.2.1.5  1.2.4.5   
6. 1.1.10.1 1.1.10.2
7. 2.4.1
## Scenario 2 (Web)
### Can Özcan 
![Can Özcan](https://github.com/bounswe/bounswe2019group2/blob/documentation/final-report/deliverables/images/cano%CC%88zcan.png?raw=true)

**Persona**
* 33 years old. 
* He is turkish and albenian.
* Currently working as a senior software developer.
* Looking for the best website possible for his future  investsments
* Views economic events and justify the impact of events to the economy.
* He is already a member of Traiders.

**Story**
* Can logs in to Traiders and sees a new notification icon on his profile page button.  
* Enters  his profile page to see  current notifications on his profile page.
* He sees an event he followed before has occured on his notifications.
* He likes the new notification feature added to the website.
* He directs himself to events page and checks his followed event's actual value.
* He sees another event that may affect the euro parity follows it.
* He decides to invest on Traiders some on Euro(?) currrency so he goes to investment page.
* When he tries to make an online investment an alert pops up which tells him to verify his email.
* He buys some Euro asset with credit card payment.
* middle east
* After the investment he made, he wants to surf around a little bit more and clicks the search bar and writes turke(which means turkish in albenian)  on search bar.
* He sees an article related to baklava clicks it , after reading the article sees comments with delicious images, likes the article , comment and follows the article.
* He checks for bitcoin's he types lite to search bar and sees other cryptos as well.
* He wonders what if he writes middle east instead. After seeing all middle east countries' currencies he simply amazed.

**Preconditions**
 * Already has an account.
 * Does not have a verified email.
 * Already tracked several events.

**Acceptance Criteria**
1. 1.1.2.1
2. 1.1.3.1
3. 1.1.5.1
4. 1.1.5.4
5. 1.1.8.1
6. 1.1.8.3
7. 1.1.8.5
8. 1.1.10.1
9. 1.1.4.5

## Scenario 3 (Web)
### Enes Yılmaz
![Enes Yılmaz](https://github.com/bounswe/bounswe2019group2/blob/documentation/final-report/deliverables/images/enesyılmaz.png?raw=true)

**Persona**
* 29 years old
* Recently married
* Works at a production facility
* Very easily influenced by opinions
* Looking for news, expert opinions

**Story**
* Enes recently married and wants to make  profitable investment for his and her wife's future.  
* He comes to our website and logs in with google. 
* He reads the articles and likes Ozgur's article.
* He visits Ozgur's profile and he thinks that this could be a nice person to follow.
* He sees the success rate of the user and is very much impressed.
* He starts to follow his portfolio.
* According to this following event, web site recommends him related portfolios.
* Then he moves to his profile.
* He wants that content produced by him is visible only to its followers.
* Because of that, he makes his profile private.

**Preconditions**
1. Uses a web browser to visit our website
2. Already has verified google account


**Acceptance Criteria**
1. 1.1.2.2
2. 1.1.3.1, 1.1.3.2, 1.1.3.3, 1.1.3.6, 1.1.3.7
3. 1.1.4.3, 1.1.4.6
4. 1.1.6.1
7. 1.1.11.1

# Project Plan
![FinalProjectPlan-1](https://user-images.githubusercontent.com/25746169/71589862-78e9b800-2b37-11ea-87b0-52448f686552.png)
![FinalProjectPlanGant-1](https://user-images.githubusercontent.com/25746169/71589906-af273780-2b37-11ea-8c09-f10285a610f8.png)

# Evaluation of tools and managing the project

## Backend
- **Amazon Web Services:** We use an AWS EC2 instance to deploy the backend side of our application.
- **Django and Django Rest Framework:** We use Django Rest Framework on top of Django. As opposed to the practice application that we developed in CMPE352, we use DRF's viewsets and serializers more often. Together they enable automatic schema generation which helps to readily produce an extensive API documentation as we develop.
- **Docker and Docker Compose:** All of our application services (nginx, database, WSGI server for backend, Node.js server for frontend) are containerized and configurable in the source code by using Dockerfiles. This helps us to define the environments in which our services run in the source code and also automate the deployment process.
- **Gunicorn**: Gunicorn is a WSGI server for production. We use it to be able to serve as many clients as possible at the same time by configuring it to use multiple workers.
- **Let's Encrypt:** We got our SSL certificate from Let's Encrypt. We use HTTPs for all web communications.
- **Nginx:** We use nginx as a router to direct coming requests to either the backend or the frontend application depending on the subdomain. Nginx also serves the static and media content such as CSS files or images.
- **Pycharm:** Pycharm is great for both coding and version control. Some features we use often are: automatic code reformatting, navigate to declaration/usage, debugging and GUI support for testing.
- **Redoc & Swagger:** We provide two different UI options for API documentation. Redoc and Swagger take the OpenAPI schema generated by DRF and turn it into an human-readable interface.
- **Travis:** We use Travis CI for style checking and testing. It helps us maintain a clean and working codebase.
- **PostgresSQL:** We think a relational database work better for our project as we will implement many components that tightly relate to each other.

## Frontend
- **Amazon Web Services:** We use an AWS EC2 instance to deploy the frontend side of our application.
- **React Javascript Framework:** The main framework to implement the Frontend side of the project.
- **Eslint-stylelint** Eslint a tool which applies the rule for AIRBNB code style. It helps to achieve readability for the team.
- **Docker and Docker Compose:** Docker is a platform to build, share, and run applications with containers which helps in therms of flexibility, security, portability, scalability.
- **Travis:** Travis is used to test the commit in terms of styling, compatibility and checks whether the code commited is working properly or not.
- **Prettier:** Automatically formats the code which helps developers saving time and energy.
- **Redux:** Redux is a module which helps the data storing in React. In other words; it helps to fetch data from the api or post data to api in a more secure, consistent way.
- **Visual Studio Code:** The IDE used to coding in React.js environment.

## Mobile
- **Android Studio:** We use an Android Studio as our integrated development environment.
- **Java:** We implement our requirements via Java programming language.
- **Android Emulator:** Android emulator simulates Android devices on our computer so that we can test our application on a variety of devices and Android API levels without needing to have each physical device.
- **Gradle:** Gradle is an open-source build-automation system that builds upon the concepts of Apache Ant and Apache Maven and introduces a Groovy-based domain-specific language (DSL) instead of the XML form used by Apache Maven for declaring the project configuration.
- **Material.io:** This website provides a design system that helps developers build high-quality digital experience. We try to follow the standards on this website. In addition to this, the icons we use in our application are taken from this website - all for free.

# Design Documents

# Mockups

## Scenario 1: Searching in articles and Looking for a parity 
***
* **User:** Emre Tur <br>
* **Platform:** Web <br>
* **User Type:** Guest <br>

**1- Our guest user Emre is on another watch in the hospital. He got so much leisure time during the night. He is interested in economic news. While he is surfing on the internet, he encounters our platform and visits it. He looks economic events.**<br>
![](https://user-images.githubusercontent.com/32342117/54496212-b27d6980-48fd-11e9-8540-daf29982881f.png)
<br>
<br>
**2- Emre clicks on the ARTICLES button then. Realizes the website is full of economy experts' articles. But he is not interested any article on the first-page.**<br>
![](https://user-images.githubusercontent.com/32342117/54496214-b27d6980-48fd-11e9-846f-2397ccbf177e.png)
<br>
<br>
**3- Emre realizes the SEARCH bar. Decides to use it to filter articles. He is using "Trump" as a keyword. After entering the word, there are related articles based on his keyword.**<br>
![](https://user-images.githubusercontent.com/32342117/54496215-b3160000-48fd-11e9-9642-0edaffb669d0.png)
<br>
<br>
**4- But there is a problem. Emre's English skills are inadequate to read an article:( He is also curious about the current USD/TRY parity for a year to invest in. Then he clicks the USD/TRY on the portfolio bar, goes to the USD/TRY page.**<br>
![](https://user-images.githubusercontent.com/32342117/54496155-400c8980-48fd-11e9-9883-c5e19faa9759.png)
<br>
<br>
**5- He looks to the daily details of the parity. He sees other (signed in) users are making 'clever' comments about the parity. He realizes he has to sign in to make comments about the parity. He also finds a daily expectation tool and clicks to the increase button as he guessed.**<br>
![](https://user-images.githubusercontent.com/32342117/54496176-6af6dd80-48fd-11e9-9cb6-a2af430b2d17.png)
<br>
<br>
**6- After clicking the increase button, he gets an alert that invites him to sign in. Emre gets a feeling that this platform serves so many tools and information about the economy and trading equipment. He decided to sign in but he couldn't do it because his advisor doctor suddenly came into the room and said: "I'VE BEEN LOOKING FOR YOU FOR AN HOUR!!".**<br>
![](https://user-images.githubusercontent.com/32342117/54497134-42281580-4908-11e9-9a21-8ca92d482185.png)
<br>
<br>

## Scenario 2: Looking at profiles of other users
***

* **User:** Özge Bozkurt <br>
* **Platform:** Web <br>
* **User Type:** Basic User <br>

**1- Özge opens the homepage of TrAiders as usual after her favorite TV show ends. She clicks the Sign In button since she wants to stalk the great users she is following and sees if they posted any articles.**<br>
![](https://github.com/bounswe/bounswe2019group2/blob/master/design/mockups/mockup2/1.png)
<br>**2- Sign In Screen shows up, Özge signs in with Google because she doesn't want to enter her email and password manually. She thinks this site is great because it provides such an easy sign-in option.**<br>
![](https://github.com/bounswe/bounswe2019group2/blob/master/design/mockups/mockup2/2.png)
<br>**3- Özge's email is filled automatically by her browser, she simply clicks the next button and she gets logged in.**<br>
![](https://github.com/bounswe/bounswe2019group2/blob/master/design/mockups/mockup2/3.png)
<br>**4- Özge is redirected to the homepage, where she lands on the event stream. She casually looks at the events that took place today. She sees nothing extraordinary happened, so she clicks the articles to see if any of the great users she follows posted anything interesting.**<br>
![](https://github.com/bounswe/bounswe2019group2/blob/master/design/mockups/mockup2/4.png)
<br>**5- She clicks on the article about Trump. She invested in oil so she got concerned of the latest news.**<br>
![](https://github.com/bounswe/bounswe2019group2/blob/master/design/mockups/mockup2/5.png)
<br>**6- She reads the article and thinks her investments are at risk.**<br>
![](https://github.com/bounswe/bounswe2019group2/blob/master/design/mockups/mockup2/6.png)
<br>**7- She gets furious at Trump and she wants to share her anger by commenting. She then clicks the post button.**<br>
![](https://github.com/bounswe/bounswe2019group2/blob/master/design/mockups/mockup2/7.png)
<br>**8- She sees the comment of Marshall Hiepler, it seems like a clever comment. She thinks she should check his page to see if he is worthy of stalking.**<br>
![](https://github.com/bounswe/bounswe2019group2/blob/master/design/mockups/mockup2/8.png)
<br>**9- She looks at Marshall's prediction success rate in USD/TL and becomes amazed. His articles look really clever. She sees that he shared his portfolio recently, so she clicks on the portfolio.**<br>
![](https://github.com/bounswe/bounswe2019group2/blob/master/design/mockups/mockup2/9.png)
<br>**10- She likes the portfolio of Marshall, she thinks oil is not safe to invest in anymore and since she loves social media platforms this Tech Stocks portfolio is perfect for her. She believes Facebook will rule the world one day. She decides to follow the portfolio, she clicks the follow button.**<br>
![](https://github.com/bounswe/bounswe2019group2/blob/master/design/mockups/mockup2/10.png)
<br>**11- She closes the portfolio.**<br>
![](https://github.com/bounswe/bounswe2019group2/blob/master/design/mockups/mockup2/11.png)
<br>**12- She follows Marshall, from now on she will stalk him regularly on her homepage.**<br>
![](https://github.com/bounswe/bounswe2019group2/blob/master/design/mockups/mockup2/12.png)
![](https://github.com/bounswe/bounswe2019group2/blob/master/design/mockups/mockup2/12_2.png)

## Scenario 3: Making an investment & Setting an alarm
***
* **User:** Muazzes Çolak <br>
* **Platform:** Mobile <br>
* **User Type:** Trader <br>

**1- Muazzes launches the application.**<br>
![](https://github.com/bounswe/bounswe2019group2/blob/master/design/mockups/mockup3/1.png)
<br><br>**2- Muazzez wants to invest her turkish liras to dollars and clik usd/try to see the fluctuations in detail.**<br>
![](https://github.com/bounswe/bounswe2019group2/blob/master/design/mockups/mockup3/2.png)

<br><br>**3-She believes there will be increase in USD/TRY parity so she decides to vote up.**<br>
![](https://github.com/bounswe/bounswe2019group2/blob/master/design/mockups/mockup3/3.png)

<br><br>**4-She confirms her prediction since predictions cannot be changed after a certain hour.**<br>
![](https://github.com/bounswe/bounswe2019group2/blob/master/design/mockups/mockup3/4.png)


<br><br>**5-After analyzing the fluctuations, she decides to buy US dollar and click buy button .**<br>
![](https://github.com/bounswe/bounswe2019group2/blob/master/design/mockups/mockup3/5.png)


<br><br>**6-She puts a limit order to buy some amount of dollars.**<br>
![](https://github.com/bounswe/bounswe2019group2/blob/master/design/mockups/mockup3/6.png)

<br><br>**7-After she gets notified, she goes to the investment tab to see her new investment.**<br>
![](https://github.com/bounswe/bounswe2019group2/blob/master/design/mockups/mockup3/7.png)

## Annotation Mock-ups for Mobile

![Mobile Annotation Mockup](https://user-images.githubusercontent.com/29541534/67635820-acac2580-f8db-11e9-8462-7d3a5d862670.png)

# Diagrams

## Use Case Diagrams
![](https://github.com/bounswe/bounswe2019group2/blob/master/design/use-case-diagram.png)

## Class Diagram
![](https://github.com/bounswe/bounswe2019group2/blob/master/design/class-diagram.png)

## Sequence Diagrams
### Sign In
![](https://github.com/bounswe/bounswe2019group2/blob/master/design/sequence-diagrams/images/signIn.png)
### Follow a User
![](https://github.com/bounswe/bounswe2019group2/blob/master/design/sequence-diagrams/images/followUser.png)

### Sharing an Article
![](https://github.com/bounswe/bounswe2019group2/blob/master/design/sequence-diagrams/images/shareArticle.png)
### Post Comment to Article
![](https://github.com/bounswe/bounswe2019group2/blob/master/design/sequence-diagrams/images/postComment.png)
### Make Manual Investment
![](https://github.com/bounswe/bounswe2019group2/blob/master/design/sequence-diagrams/images/manualInvestment.png)
### Creating a Portfolio
![](https://github.com/bounswe/bounswe2019group2/blob/master/design/sequence-diagrams/images/createPortfolio.png)

### Buy Order
![](https://github.com/bounswe/bounswe2019group2/blob/master/design/sequence-diagrams/images/buyOrder.png)

### Sign Up
![](https://github.com/bounswe/bounswe2019group2/blob/master/design/sequence-diagrams/images/signUp.png)
![](https://github.com/bounswe/bounswe2019group2/blob/master/design/sequence-diagrams/images/searchEquipment.png)
### Track Event
![](https://github.com/bounswe/bounswe2019group2/blob/master/design/sequence-diagrams/images/trackEvent.png)
### Predict Equipment 
![](https://github.com/bounswe/bounswe2019group2/blob/master/design/sequence-diagrams/images/predictEquipment.png)

# System Manual
This document describes how to build, configure and deploy TrAiders's web services. 

## Requirements
* [Docker](https://docs.docker.com/install/)
* [docker-compose](https://docs.docker.com/compose/install/)
* [git](https://git-scm.com/)

## Configuration
TrAider's services are configured by using an environment file. 
Create an empty file under your home directory with the name `traiders_prod_env`. 
### Parameters
* **SECRET_KEY**: A sequence of characters that is used for securing sensitive information. 
Make sure it is at least 50 characters long and kept secret.
* **ALPHA_VANTAGE_KEYS**: A comma separated list of [AlphaVantage](https://www.alphavantage.co/) API keys.
If you add more than one keys, the system automatically scales up to support more parities. 
* **EMAIL_PASSWORD**: [SendGrid](https://sendgrid.com/) API key. 
* **GOOGLE_OAUTH_ID**: Google OAuth ID. 
* **GOOGLE_OAUTH_SECRET**: Google OAuth Secret.

Google OAuth ID and Secret should be created on http://console.developers.google.com.

An example environment file should look like this:
```
SECRET_KEY=sdK1iONjl3WYtdpriLniqVkoIMz6fFo1E7S1yh2UfjlKcuNkiwYPZf7nhTpQUIV4
ALPHA_VANTAGE_KEYS=VDVRICLYITWLZAJI
EMAIL_PASSWORD=XZWQy0DDJDquRqNn.l7fhnhwLmoI1lldsbnvhLfLRM628MZKUau1CduwJF3.xu8nD4Ojl
GOOGLE_OAUTH_ID=885569868037-6irtdcclm633kocml09yck0yzp77boxt.apps.googleusercontent.com
GOOGLE_OAUTH_SECRET=AhloDHEOJ7gABXt_00BGCRjq
```

## How to Build & Deploy

### 1. Clone the repository and navigate to the sources root.
```bash
git clone https://github.com/bounswe/bounswe2019group2
cd bounswe2019group2/traiders
```

### 2. Build & run
```bash
docker-compose up -d --build
```

### 3. Restore content from database dumps
```bash
docker exec traiders_db_1 psql -U postgres -d postgres < db-dumps/traiders_db.sql
docker exec traiders_annotation_db_1 psql -U postgres -d postgres < db-dumps/traiders_annotation_db.sql
```

# User Manual
This manual is designed for the end-users who wish to use our Traiders application in web or mobile platform.

## Register

A Basic User, who registered the system without stating his/her IBAN, can benefit all features except most of 
Investment operations. 

A Trader User, who registered the system giving his/her IBAN, can make use of all functions of our application.

A Guest User, who have not registered, can only view Articles, Events, Trading Equipment and Parities.

One who wants to use our application as Trader or Basic User should register to the application.
In registration form, username, password, password confirmation, e-mail address, full name of the
user should be typed and the location should be given via Google maps or text. If one wants to register as Trader User,
he or she is supposed to mark the related box and then type a valid IBAN.

## Login

One should login the application by Google account or by typing username and password in login form. 
The box _Remember me_ should be marked to save the credentials to the Web browser.  _Forgot Password_ should
be clicked in case a user wants to learn or update his or her password.

## Profile

A Guest User do not have a Profile page. She or he can only view another user's Profile page if it is public account. 
In profile page one can see her/his information(username, follower and following numbers, etc.), portfolios, success rate and notifications. 
To edit user profile edit button should be used. 
A Basic User can be Trader User using edit, he or she should give a valid IBAN and verify by e-mail.
A button is used to switch the profile between public and private mode. 

If the profile is private, then profile is not visible by one who is not follower of the account. To follow
a private profile, one should send a request and pending requests are listed in private profile mode.


## Trading Equipment and Parities
In home page, many parities are presented. 

Each Trading Equipment and each Parity has their own page. 


In a Trading Equipment's page, one can see related parities, comments and make comment about the equipment.


In a Parity's page, one can see the graphics with daily, monthly, yearly, MA50, MA100, MA200 labels.

First three graphics are conversion ratio changes depending close values in corresponding time scales and
the last three graphics are Moving Averages for last 50, 100 and 200 days for this parity.
One can make prediction about the parity conversion ratio increase or decrease for the day.

## Portfolio: How to follow Equipment and Parities
A Portfolio is used to follow a set of parities. 
One might need to follow different sets of parities for different financial strategies.
For this purpose, a Basic or Trader User can create his/her own portfolio with a given name, add-drop parities,
follow another user's portfolio. 

In Portfolio tab, "My Portfolios" and "Followed Portfolios" are presented.
One can also simply use Profile page to edit his or her own portfolios.

## Social Interactions with Other Users
Our Traders application is convenient for users to interact with each other, 
share their ideas and economic strategies. 

One can share an Article which is a text with or without picture. He or she can also edit or delete it.
The Articles written by users are listed in homepage and in Articles section of Social tab. 
A User can like or make comment with or without photo on an Article and other people see 
and like these comments. 

One can see the author of an Article and can follow the author directly without going to his/her Profile page. 
One might not simply follow someone if the other user's profile is private, 
then application creates a Following Request and the current user should wait 
until the other user accepts this request.

One can annotate a part of the text or part of the image in Article with a text or image. 
To annotate an image, one should click and drag, then he or she can submit an image or text.
To annotate a text, one should select the text desired to be annotated, then he/she can submit an image or text.
Annotations are colourfully shown and one can simply read annotation, learn who annotated and view even nested annotations.

An example use of text annotation can be "The previous value is %1.2" 
annotated to a part of text telling "FED will make announcement on inflation rate."

## Economic Events
An Event can be simplified to an announcement of a value by authorities in a country. 
Economic events can be seen by a User in Events section of Social tab. An event table is presented to
a User. Events have properties such as name, actual value, previous value, country etc. When an event occurs,
it means the actual value has just been announced. A User can follow an Event to be notified when this Event
occurs.

## Financial Investments

There are 2 types of investments in TrAiders: Manual investments and online investments. To be able
to make investments a user should first become a Trader and verify their e-mail address.

A user can add manual investments that they made outside of the TrAiders platform to see the profit or the loss of 
their investment. Users should provide the buy and sell amount together with the date of transaction for TrAiders to 
calculate the profit/loss value by considering the up-to-date prices.

Users can also buy and sell investment equipment directly on the platform. While investing, users have the option of 
paying with a credit card or spending directly from their assets. To invest using a credit card, a user should provide the 
equipment to be sold, the equipment to be bought and the amount they want to buy. After the payment, the desired amount
is added to their assets. If the user selects to spend from their assets, the same thing happens but this time the price 
gets subtracted from their assets. 

Users can also give buy and stop-loss orders to automatically buy or sell equipment. Giving a buy order is 
basically the same as making an online investment but the user also provides the ratio they desire. If the current ratio of the parity
drops below the desired amount, the investment happens. Stop-loss orders can be given to reverse an investment to avoid losses.

## Notifications

Notifications can only be seen when one logged in. 
Users can see number of unseen notifications on user button in navbar. 
Notifications are shown in user profile page in detail. 
One can click to a notification to see the related thing that triggered the notification.
If a notification is not clicked before, the background color is blue, otherwise gray. 

Four different reasons can trigger a notification for a User:

A user who is followed by the current user shares an article.

An economic event which the current user followed occurs.

Stop-Loss Order or Buy Order given by the current user has been implemented.

Change in a Parity value meets the condition of the alert set by the current.

## Recommendations  
In Recommendation tab, a User-specific table is presented to a User. 
In this table, a User can view the recommended Articles, Equipments, Parities, Events and Users. 
Also, the reason behind each Recommendation is presented to the User on the object recommended.

## Search

A User should type in Search tab what he or she wish to find and then a table (Articles, Equipments, Parities, Events and Users)
is presented to the User. She or he can check by object type to find the thing she/he is looking for. 

Search property can also be used to find something which is not exactly known since it implements Semantic Search algorithms and come up with a relevant results which are not exactly specified beforehand.

# API Documentation


![ReDoc-001](https://user-images.githubusercontent.com/29541534/71646575-0d9d1300-2cfc-11ea-94f0-adb6435dce03.jpg)
![ReDoc-002](https://user-images.githubusercontent.com/29541534/71646576-0d9d1300-2cfc-11ea-8266-547307fb69e4.jpg)
![ReDoc-003](https://user-images.githubusercontent.com/29541534/71646577-0d9d1300-2cfc-11ea-9c9b-5aaf1cb46cda.jpg)
![ReDoc-004](https://user-images.githubusercontent.com/29541534/71646578-0e35a980-2cfc-11ea-863e-c2217905c416.jpg)
![ReDoc-005](https://user-images.githubusercontent.com/29541534/71646579-0e35a980-2cfc-11ea-8663-97dc7765069e.jpg)
![ReDoc-006](https://user-images.githubusercontent.com/29541534/71646580-0e35a980-2cfc-11ea-8348-e8e0d1c011ef.jpg)
![ReDoc-007](https://user-images.githubusercontent.com/29541534/71646581-0ece4000-2cfc-11ea-88be-e4ecc1b25bdd.jpg)
![ReDoc-008](https://user-images.githubusercontent.com/29541534/71646582-0ece4000-2cfc-11ea-931a-effffbf42389.jpg)
![ReDoc-009](https://user-images.githubusercontent.com/29541534/71646583-0ece4000-2cfc-11ea-9b85-51ee86d13927.jpg)
![ReDoc-010](https://user-images.githubusercontent.com/29541534/71646584-0f66d680-2cfc-11ea-9bf6-c685d4015462.jpg)
![ReDoc-011](https://user-images.githubusercontent.com/29541534/71646585-0f66d680-2cfc-11ea-98bc-07992a9ae00b.jpg)
![ReDoc-012](https://user-images.githubusercontent.com/29541534/71646586-0f66d680-2cfc-11ea-8e82-b74567cf22d4.jpg)
![ReDoc-013](https://user-images.githubusercontent.com/29541534/71646587-0fff6d00-2cfc-11ea-8bc9-5e4daa42a3ee.jpg)
![ReDoc-014](https://user-images.githubusercontent.com/29541534/71646588-0fff6d00-2cfc-11ea-9d76-032a3f9f1448.jpg)
![ReDoc-015](https://user-images.githubusercontent.com/29541534/71646589-0fff6d00-2cfc-11ea-9773-1b8abf6fbd1c.jpg)
![ReDoc-016](https://user-images.githubusercontent.com/29541534/71646590-10980380-2cfc-11ea-87ea-c4f2c24a320d.jpg)
![ReDoc-017](https://user-images.githubusercontent.com/29541534/71646591-10980380-2cfc-11ea-8e3d-59002b6f0fd7.jpg)
![ReDoc-018](https://user-images.githubusercontent.com/29541534/71646592-11309a00-2cfc-11ea-9108-75019a783527.jpg)
![ReDoc-019](https://user-images.githubusercontent.com/29541534/71646593-11309a00-2cfc-11ea-9bb4-c4551e3efd70.jpg)
![ReDoc-020](https://user-images.githubusercontent.com/29541534/71646594-11309a00-2cfc-11ea-8969-aa55370e1c35.jpg)
![ReDoc-021](https://user-images.githubusercontent.com/29541534/71646595-11c93080-2cfc-11ea-9ecf-0f94b7915193.jpg)
![ReDoc-022](https://user-images.githubusercontent.com/29541534/71646596-11c93080-2cfc-11ea-8701-85d1861bc178.jpg)
![ReDoc-023](https://user-images.githubusercontent.com/29541534/71646597-11c93080-2cfc-11ea-9672-d613d8e98395.jpg)
![ReDoc-024](https://user-images.githubusercontent.com/29541534/71646598-1261c700-2cfc-11ea-9780-be91bc766701.jpg)
![ReDoc-025](https://user-images.githubusercontent.com/29541534/71646599-1261c700-2cfc-11ea-8733-58608364cf0f.jpg)
![ReDoc-026](https://user-images.githubusercontent.com/29541534/71646600-1261c700-2cfc-11ea-950e-d841a1f8e506.jpg)
![ReDoc-027](https://user-images.githubusercontent.com/29541534/71646601-12fa5d80-2cfc-11ea-9a7b-527ef033db41.jpg)
![ReDoc-028](https://user-images.githubusercontent.com/29541534/71646602-12fa5d80-2cfc-11ea-8947-d1b4f6af33d6.jpg)
![ReDoc-029](https://user-images.githubusercontent.com/29541534/71646603-12fa5d80-2cfc-11ea-8a9c-342a00f50c91.jpg)
![ReDoc-030](https://user-images.githubusercontent.com/29541534/71646604-1392f400-2cfc-11ea-97f9-4254a23023a8.jpg)
![ReDoc-031](https://user-images.githubusercontent.com/29541534/71646605-1392f400-2cfc-11ea-9ef6-12f3df61aa26.jpg)
![ReDoc-032](https://user-images.githubusercontent.com/29541534/71646606-142b8a80-2cfc-11ea-9267-57dc359a1f16.jpg)
![ReDoc-033](https://user-images.githubusercontent.com/29541534/71646607-142b8a80-2cfc-11ea-9a91-45721d9283f9.jpg)
![ReDoc-034](https://user-images.githubusercontent.com/29541534/71646610-14c42100-2cfc-11ea-8292-298b22fa7d3e.jpg)
![ReDoc-035](https://user-images.githubusercontent.com/29541534/71646611-14c42100-2cfc-11ea-9a35-b61e907692b4.jpg)
![ReDoc-036](https://user-images.githubusercontent.com/29541534/71646612-14c42100-2cfc-11ea-8431-755cad84cdb6.jpg)
![ReDoc-037](https://user-images.githubusercontent.com/29541534/71646613-155cb780-2cfc-11ea-9e0a-e22bb5e01ac8.jpg)
![ReDoc-038](https://user-images.githubusercontent.com/29541534/71646614-155cb780-2cfc-11ea-9e85-6be5ad0ef9f3.jpg)
![ReDoc-039](https://user-images.githubusercontent.com/29541534/71646615-155cb780-2cfc-11ea-87db-5b8a9b179b35.jpg)
![ReDoc-040](https://user-images.githubusercontent.com/29541534/71646616-15f54e00-2cfc-11ea-8c40-178e6672e33f.jpg)
![ReDoc-041](https://user-images.githubusercontent.com/29541534/71646617-15f54e00-2cfc-11ea-9353-337369aae3ae.jpg)
![ReDoc-042](https://user-images.githubusercontent.com/29541534/71646618-15f54e00-2cfc-11ea-9553-29a44f381ccc.jpg)
![ReDoc-043](https://user-images.githubusercontent.com/29541534/71646619-168de480-2cfc-11ea-8c0a-587d837a59f9.jpg)
![ReDoc-044](https://user-images.githubusercontent.com/29541534/71646620-168de480-2cfc-11ea-909a-ac450aec0e82.jpg)
![ReDoc-045](https://user-images.githubusercontent.com/29541534/71646621-168de480-2cfc-11ea-8e62-768c6e331be6.jpg)
![ReDoc-046](https://user-images.githubusercontent.com/29541534/71646622-17bf1180-2cfc-11ea-87dc-2c4ca78d8246.jpg)
![ReDoc-047](https://user-images.githubusercontent.com/29541534/71646624-17bf1180-2cfc-11ea-8496-cb4c3475c763.jpg)
![ReDoc-048](https://user-images.githubusercontent.com/29541534/71646625-17bf1180-2cfc-11ea-859b-811a5fdbb2ea.jpg)
![ReDoc-049](https://user-images.githubusercontent.com/29541534/71646626-1857a800-2cfc-11ea-98d5-d6444fa71d1a.jpg)
![ReDoc-050](https://user-images.githubusercontent.com/29541534/71646627-18f03e80-2cfc-11ea-92dd-a393ae427535.jpg)
![ReDoc-051](https://user-images.githubusercontent.com/29541534/71646628-18f03e80-2cfc-11ea-8a58-3a42ee9c28e7.jpg)
![ReDoc-052](https://user-images.githubusercontent.com/29541534/71646629-18f03e80-2cfc-11ea-8fed-c55c2d044d44.jpg)
![ReDoc-053](https://user-images.githubusercontent.com/29541534/71646630-1988d500-2cfc-11ea-8dc6-6d2e9ec3ab77.jpg)
![ReDoc-054](https://user-images.githubusercontent.com/29541534/71646631-1988d500-2cfc-11ea-98f9-d3ca3a7d6dd3.jpg)
![ReDoc-055](https://user-images.githubusercontent.com/29541534/71646632-1a216b80-2cfc-11ea-8666-e525441c2f2c.jpg)
![ReDoc-056](https://user-images.githubusercontent.com/29541534/71646633-1a216b80-2cfc-11ea-925b-61a87cf7b574.jpg)
![ReDoc-057](https://user-images.githubusercontent.com/29541534/71646634-1a216b80-2cfc-11ea-8353-7a9d9389eb2a.jpg)
![ReDoc-058](https://user-images.githubusercontent.com/29541534/71646636-1aba0200-2cfc-11ea-9424-c7610bfdbc1f.jpg)
![ReDoc-059](https://user-images.githubusercontent.com/29541534/71646637-1b529880-2cfc-11ea-823f-2cb0731cac99.jpg)
![ReDoc-060](https://user-images.githubusercontent.com/29541534/71646638-1b529880-2cfc-11ea-9873-be1c8eb057ab.jpg)
![ReDoc-061](https://user-images.githubusercontent.com/29541534/71646639-1b529880-2cfc-11ea-89c7-24b9342125bc.jpg)
![ReDoc-062](https://user-images.githubusercontent.com/29541534/71646640-1beb2f00-2cfc-11ea-8b11-30e941821c77.jpg)
![ReDoc-063](https://user-images.githubusercontent.com/29541534/71646641-1beb2f00-2cfc-11ea-8bd1-c4e657c0fc87.jpg)
![ReDoc-064](https://user-images.githubusercontent.com/29541534/71646642-1beb2f00-2cfc-11ea-8210-79d9dd4441bb.jpg)
![ReDoc-065](https://user-images.githubusercontent.com/29541534/71646643-1c83c580-2cfc-11ea-942d-8646f0bf511b.jpg)
![ReDoc-066](https://user-images.githubusercontent.com/29541534/71646644-1c83c580-2cfc-11ea-8acc-fc07d18d05e0.jpg)
![ReDoc-067](https://user-images.githubusercontent.com/29541534/71646645-1d1c5c00-2cfc-11ea-9399-f3e82f8a193a.jpg)
![ReDoc-068](https://user-images.githubusercontent.com/29541534/71646646-1d1c5c00-2cfc-11ea-8ef8-42a2f625c8e4.jpg)
![ReDoc-069](https://user-images.githubusercontent.com/29541534/71646647-1d1c5c00-2cfc-11ea-8aa0-213c804b3fbd.jpg)
![ReDoc-070](https://user-images.githubusercontent.com/29541534/71646648-1db4f280-2cfc-11ea-9fa4-f0e9656108e7.jpg)
![ReDoc-071](https://user-images.githubusercontent.com/29541534/71646650-1db4f280-2cfc-11ea-9af1-5cd6fa002d7e.jpg)
![ReDoc-072](https://user-images.githubusercontent.com/29541534/71646651-1db4f280-2cfc-11ea-817d-c4c6b95eeaa3.jpg)
![ReDoc-073](https://user-images.githubusercontent.com/29541534/71646652-1e4d8900-2cfc-11ea-9765-94c8b3340617.jpg)
![ReDoc-074](https://user-images.githubusercontent.com/29541534/71646653-1e4d8900-2cfc-11ea-895c-4814c06085bc.jpg)
![ReDoc-075](https://user-images.githubusercontent.com/29541534/71646654-1e4d8900-2cfc-11ea-9ba5-94ffba2b5530.jpg)
![ReDoc-076](https://user-images.githubusercontent.com/29541534/71646655-1ee61f80-2cfc-11ea-9e2b-48290a357747.jpg)
![ReDoc-077](https://user-images.githubusercontent.com/29541534/71646656-1ee61f80-2cfc-11ea-98b2-b00a54c05994.jpg)
![ReDoc-078](https://user-images.githubusercontent.com/29541534/71646657-1ee61f80-2cfc-11ea-83db-c342269cf01c.jpg)
![ReDoc-079](https://user-images.githubusercontent.com/29541534/71646658-1f7eb600-2cfc-11ea-9e53-77974698c9ef.jpg)
![ReDoc-080](https://user-images.githubusercontent.com/29541534/71646659-1f7eb600-2cfc-11ea-8dd5-c60277a97bd1.jpg)
![ReDoc-081](https://user-images.githubusercontent.com/29541534/71646661-1f7eb600-2cfc-11ea-8e1d-341692db9f13.jpg)
![ReDoc-082](https://user-images.githubusercontent.com/29541534/71646662-20174c80-2cfc-11ea-8feb-41e3e494d365.jpg)
![ReDoc-083](https://user-images.githubusercontent.com/29541534/71646663-20174c80-2cfc-11ea-95d9-fa6af872b050.jpg)
![ReDoc-084](https://user-images.githubusercontent.com/29541534/71646664-20afe300-2cfc-11ea-9362-838018f04ad2.jpg)
![ReDoc-085](https://user-images.githubusercontent.com/29541534/71646665-20afe300-2cfc-11ea-9432-4d2bd4429c57.jpg)
![ReDoc-086](https://user-images.githubusercontent.com/29541534/71646666-21487980-2cfc-11ea-9324-c57d5391e356.jpg)
![ReDoc-087](https://user-images.githubusercontent.com/29541534/71646667-21487980-2cfc-11ea-91eb-fbbc9bade96b.jpg)
![ReDoc-088](https://user-images.githubusercontent.com/29541534/71646668-21487980-2cfc-11ea-8008-3ff48bc3d281.jpg)
![ReDoc-089](https://user-images.githubusercontent.com/29541534/71646669-21e11000-2cfc-11ea-9807-8f1861bb5b06.jpg)
![ReDoc-090](https://user-images.githubusercontent.com/29541534/71646670-21e11000-2cfc-11ea-92a1-d8b01cb2d534.jpg)
![ReDoc-091](https://user-images.githubusercontent.com/29541534/71646671-21e11000-2cfc-11ea-8e34-db09d821b842.jpg)
![ReDoc-092](https://user-images.githubusercontent.com/29541534/71646672-2279a680-2cfc-11ea-959b-8721b4448497.jpg)
![ReDoc-093](https://user-images.githubusercontent.com/29541534/71646673-2279a680-2cfc-11ea-838a-63901db59706.jpg)
![ReDoc-094](https://user-images.githubusercontent.com/29541534/71646674-23123d00-2cfc-11ea-84d1-fb05fb485198.jpg)
![ReDoc-095](https://user-images.githubusercontent.com/29541534/71646676-23123d00-2cfc-11ea-888d-e0700c9db4e2.jpg)
![ReDoc-096](https://user-images.githubusercontent.com/29541534/71646677-23aad380-2cfc-11ea-8c83-16819949f2e1.jpg)
![ReDoc-097](https://user-images.githubusercontent.com/29541534/71646678-23aad380-2cfc-11ea-8946-f0eca1d8b2c3.jpg)
![ReDoc-098](https://user-images.githubusercontent.com/29541534/71646679-24436a00-2cfc-11ea-9e53-da482fd9ac87.jpg)
![ReDoc-099](https://user-images.githubusercontent.com/29541534/71646680-24436a00-2cfc-11ea-9ec8-1b3805cd946c.jpg)
![ReDoc-100](https://user-images.githubusercontent.com/29541534/71646681-24436a00-2cfc-11ea-9b15-09bca5dcc665.jpg)
![ReDoc-101](https://user-images.githubusercontent.com/29541534/71646682-24dc0080-2cfc-11ea-80cc-ba797748dd5e.jpg)
![ReDoc-102](https://user-images.githubusercontent.com/29541534/71646683-25749700-2cfc-11ea-9884-d58d0bfeb888.jpg)
![ReDoc-103](https://user-images.githubusercontent.com/29541534/71646684-25749700-2cfc-11ea-812c-55b51e4c7a1d.jpg)
![ReDoc-104](https://user-images.githubusercontent.com/29541534/71646685-25749700-2cfc-11ea-8e4c-20dcc4d607ee.jpg)
![ReDoc-105](https://user-images.githubusercontent.com/29541534/71646686-260d2d80-2cfc-11ea-9b70-d7e694b02400.jpg)
![ReDoc-106](https://user-images.githubusercontent.com/29541534/71646687-260d2d80-2cfc-11ea-8c61-a816e87dc6b8.jpg)
![ReDoc-107](https://user-images.githubusercontent.com/29541534/71646688-26a5c400-2cfc-11ea-9bde-95ceed9db3d4.jpg)
![ReDoc-108](https://user-images.githubusercontent.com/29541534/71646689-26a5c400-2cfc-11ea-8964-03ad83eb5d20.jpg)
![ReDoc-109](https://user-images.githubusercontent.com/29541534/71646690-26a5c400-2cfc-11ea-9fd6-df3db67fe55c.jpg)
![ReDoc-110](https://user-images.githubusercontent.com/29541534/71646691-273e5a80-2cfc-11ea-894c-8d997e4a468f.jpg)
![ReDoc-111](https://user-images.githubusercontent.com/29541534/71646692-273e5a80-2cfc-11ea-8078-9276fccbfe61.jpg)
![ReDoc-112](https://user-images.githubusercontent.com/29541534/71646693-27d6f100-2cfc-11ea-83c6-6546f230a6ed.jpg)
![ReDoc-113](https://user-images.githubusercontent.com/29541534/71646694-27d6f100-2cfc-11ea-9f7d-26e965b710a5.jpg)
![ReDoc-114](https://user-images.githubusercontent.com/29541534/71646695-27d6f100-2cfc-11ea-9833-a851b4423aa5.jpg)
![ReDoc-115](https://user-images.githubusercontent.com/29541534/71646696-286f8780-2cfc-11ea-8689-c92454d4d4ca.jpg)
![ReDoc-116](https://user-images.githubusercontent.com/29541534/71646697-286f8780-2cfc-11ea-999b-dc0b1a7f4b9f.jpg)
![ReDoc-117](https://user-images.githubusercontent.com/29541534/71646698-29081e00-2cfc-11ea-8835-ec28ea9d2837.jpg)
![ReDoc-118](https://user-images.githubusercontent.com/29541534/71646699-29081e00-2cfc-11ea-9029-0bc6f35bfd29.jpg)
![ReDoc-119](https://user-images.githubusercontent.com/29541534/71646700-29081e00-2cfc-11ea-8899-363e3f1aa71c.jpg)
![ReDoc-120](https://user-images.githubusercontent.com/29541534/71646701-29a0b480-2cfc-11ea-83fc-fce49d4226d6.jpg)
![ReDoc-121](https://user-images.githubusercontent.com/29541534/71646702-2a394b00-2cfc-11ea-8d95-8c2815a8813c.jpg)
![ReDoc-122](https://user-images.githubusercontent.com/29541534/71646703-2a394b00-2cfc-11ea-9ce8-9162b4861bd7.jpg)
![ReDoc-123](https://user-images.githubusercontent.com/29541534/71646704-2a394b00-2cfc-11ea-97c1-5e92076b30f7.jpg)
![ReDoc-124](https://user-images.githubusercontent.com/29541534/71646705-2ad1e180-2cfc-11ea-9658-c619774c47bb.jpg)
![ReDoc-125](https://user-images.githubusercontent.com/29541534/71646706-2ad1e180-2cfc-11ea-9153-7d4e7a8aeeec.jpg)
![ReDoc-126](https://user-images.githubusercontent.com/29541534/71646707-2b6a7800-2cfc-11ea-906c-7458598a3a5b.jpg)

# Annotation API Documentation

![ReDoc-Annotation-1](https://user-images.githubusercontent.com/29541534/71646738-9d42c180-2cfc-11ea-8a4f-07944c1bcea8.jpg)
![ReDoc-Annotation-2](https://user-images.githubusercontent.com/29541534/71646739-9d42c180-2cfc-11ea-871e-721bcc60261b.jpg)
![ReDoc-Annotation-3](https://user-images.githubusercontent.com/29541534/71646740-9d42c180-2cfc-11ea-9624-17e1cf9a0c42.jpg)
![ReDoc-Annotation-4](https://user-images.githubusercontent.com/29541534/71646741-9ddb5800-2cfc-11ea-875b-8b4fa1245610.jpg)
![ReDoc-Annotation-5](https://user-images.githubusercontent.com/29541534/71646742-9ddb5800-2cfc-11ea-86f2-2b01982080c1.jpg)
![ReDoc-Annotation-6](https://user-images.githubusercontent.com/29541534/71646743-9ddb5800-2cfc-11ea-88fa-c28e124edbb2.jpg)

