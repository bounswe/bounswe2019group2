# Executive Summary

## Project Description

Our project is a traders platform for traders and enthusiasts of finance to easily keep track of everything related to finance.
The easy to use interface, availability in Android and web, location-based news search makes this platform perfect for anyone, anywhere. The functionality of the platform differs for different client types. A guest user can view economic events, different aspects of trading equipment, articles and profiles of public users. This way they have a chance to improve themselves in trading by following other experienced users.
Basic users can do everything a guest does and much more. They can keep track of their profit/loss by manually entering their investments, they can write articles, rate and comment articles, they can set alarms for economic events and price levels of trading equipment, they can create portfolios and they can make predictions about the price levels estimating whether the prices will drop or rise.
Our privileged trader users can use the platform to buy and sell any trading equipment they want by integrating their private bank accounts to the platform.
This makes it much easier to track their profits. What makes this platform unique is that it is also a social platform, where you can follow many inspiring users who will give tips on financial matters. You can comment and start discussions about finance and you can learn a lot from others.

For more detailed information and functionalities, refer to Requirements Section.

## Project Status

After CMPE352, we already had some standards that we have planned out.
We had PR Templates, Issue Templates, related workflow and process rules, a procedure for taking over the work and sharing the responsibility.

Through the first few weeks of the semester, things are working well in terms of workflow.
Our team has 3 subgroups, namely Backend (3 people), Frontend(3 people) and Mobile(2 people).

So far, we have managed to keep everything implemented in parallel with the help of priority oriented planning.
We have:
* Our web project deployed at [traiders.tk](//traiders.tk),
* API deployed at [api.traiders.tk](//api.traiders.tk),
* Mobile app APK downloadable at [api.traiders.tk/mobile](//api.traiders.tk/mobile)

Thus everything is accessible.

First few weeks almost always mean struggle, we tried to adapt to a new workload, losing a few members from last year,
welcoming our new members, meeting and getting used to each other.
The thing that mattered most to us is documentation and accessibility for all of the members.
We have our API Documented, code commented and everything shared in several different features of GitHub (milestones, projects, wiki..).
Occasionally we have updated our requirements, class diagram and we will continue doing so as needed.

We are still using Travis for unit testing and code style checks.

## Moving Forward

We noticed that we could do better in terms of few aspects.
Firstly, we argue that we need a better implementation plan.
Starting from the October 21 we decided to proceed with the requirement oriented planning.
Each week, all of the groups will focus on a pre-determined set of requirements. For example, in the week of October 22 - October 29, we decided to focus on Requirements 1.1-1.4. Since this is a new thing to us, of course adjusting could take some time but we believe this is important for taking concrete steps. We also prepared a [spreadsheet](https://docs.google.com/spreadsheets/d/197Z9591lSS0qo-7xH_Fwe_VQu7tZ5TOg/edit#gid=1734224127) to track our progress in terms of requirements. Each team will mark the requirements they have fullfilled.

We will keep using our workflow in issues and pull requests.
At least 2 reviewer should approve each person's code.
We will hold group coding sessions for boosting.

In terms of this milestone, we feel like we are in a good place but also we believe we could have done more.
The requirement oriented implementation schedule will hopefully help us move forward faster.

# Deliverables

| Deliverable:                     | Status:     | Update Frequency      | Description                                                                           |
| -------------------------------- | ----------- | --------------------- | ------------------------------------------------------------------------------------- |
| 1- GitHub Wiki                   | Complete    | Weekly                | Accessible github wiki pages, up-to-date information related to project can be found. |
| 2- GitHub Issues & Pull Requests | Complete    | As improvement needed | Issue labels, templates, workflow.                                                    |
| 3- Meeting Notes                 | In Progress | Weekly                | Publishing meeting notes in GitHub Wiki.                                              |
| 4- Requirements                  | Complete    | As improvement needed | Sharing the requirements analysis related to the project. Updating as neeeded.        |
| 5- Mockups                       | Complete    | As improvement needed | To stay in the same page with the customer.                                           |
| 6- Design Diagrams               | Complete    | Per feedback for now  | Posting design diagrams to wiki page                                                  |
| 7- Project Plan                  | In progress | -                     | Preparing the project plan                                                            |
| 8- API                           | In progress | Weekly                | Backend of the project. Related endpoints, management of DB etc.                      |
| 9- API Documentation             | In progress | As improvement needed | API Documentation for the users of endpoints.                                         |
| 10- Deployment and Security      | In progress | As improvement needed | Deployment of the project and accesibility                                            |
| 11- Web Project, Frontend        | In progress | Weekly                | Frontend project and accesibility                                                     |
| 12- Mobile App                   | In progress | Weekly                | Mobile application and accesibility                                                   |

**1- GitHub Wiki:**
We are updating our wiki page as needed, pushing meeting notes and keeping everything from requirements to group members updated on there.

**2- GitHub Issues & PRs:**
We still use our previous convention. All can be traced in the repo. Everyone creates their own issue, people should not be closing their issue without the review of at least 2 other people, preferably from the same team. Issue Templates and PR templates are used during the creation.

**3- Meeting Notes:**
Meeting notes are still accesible through wiki page.
We are always utilizing those to refer to action items, remember our agenda and goals.

**4- Requirements:**
We have rarely updated our requirements so far, but we always keep reviewing them during the implementation phase.

**5- Mockups:**
In addition to our previous mockups, we have a new annotation mockup to stay in the same page with the customer. You can refer to the Mockup section for the annotation mockup.

**6- Design Diagrams:**
We have updated our class diagram according to our implementation plan so far.
We believe there will still be updated during the implementation as we figure out better ways of doing things.

**7- Project Plan:**
Project plan can also be found below. As mentioned above, we have decided to take a requirement oriented approach.
Thus in the project plan, the tabs refer to our requirements. Each week we plan to implement couple of those.

**8- API:**
Our API is almost daily updated. As of now we have functionalities for Equipments, Parities, Articles, Comments, Login, Signup, Following. All of those are documented.
You could check it out at [api.traiders.tk](//api.traiders.tk)

**9- API Documentation:**
We are using 2 sorts of Documentation pages, which are accesible through [api.traiders.tk/docs](//api.traiders.tk/docs) and [api.traiders.tk/redocs](//api.traiders.tk/redocs). There you can find example calls, the endpoints and more.

**10- Deployment and Security:**
We frequently deployed our application's latest version throughout the development process so that it would always be up to date. We have experienced some errors at first but now we think we came to a stable point where we can deploy the last version with just a simple docker-compose command. We will keep continiously deploying in the future also. 

We have configured our server to use HTTPs and redirect all HTTP requests to HTTPs.

**11- Web Project, Frontend**

**12- Mobile App**

# Work Done by Each Member

## Group Members

- Alperen Kürşat Özkan
- Fatih İver
- Harun Eren
- Mert Yüksekgönül
- Muhammet Furkan Gök
- Özgür Solak
- Rukiye Dilruba Köse
- Yunus Emre İnci(Communicator)

## Customers

- Suzan Uskudarli
- Alper Ahmetoğlu

# Requirements

# Table of Contents

- [Glossary](#glossary)
  - [1. Functional Requirements](#1-functional-requirements)
    - [1.1. User Requirements](#11-user-requirements)
      - [1.1.1. Sign Up](#111-sign-up)
      - [1.1.2. Sign In](#112-sign-in)
      - [1.1.3. Profile](#113-profile)
      - [1.1.4. Social Interactions and Communication](#114-social-interactions-and-communication)
      - [1.1.5. Economic Events](#115-economic-events)
      - [1.1.6. Portfolios](#116-portfolios)
      - [1.1.7. Trading Equipment and Parities](#117-trading-equipment-and-parities)
      - [1.1.8. Investments](#118-investments)
      - [1.1.9. Profit/Loss](#119-profitloss)
      - [1.1.10. Search](#1110-search)
      - [1.1.11. Recommendations](#1111-recommendations)
      - [1.1.12. Admin Panel](#1112-admin-panel)
    - [1.2. System Requirements](#12-system-requirements)
      - [1.2.1. Interactions](#121-interactions)
      - [1.2.2. Recommendation](#122-recommendation)
      - [1.2.3. Searching](#123-searching)
      - [1.2.4. Trading Equipments and Parities](#124-trading-equipments-and-parities)
  - [2. Non-Functional Requirements](#2-non-functional-requirements)
    - [2.1. Security](#21-security)
    - [2.2. Performance](#22-performance)
    - [2.3. Availability and Accessibility](#23-availability-and-accessibility)
    - [2.4. Annotations](#24-annotations)

# Glossary

Note: Aliases for terms are given in parentheses.

- **Annotation:** A note or comment typically used to convey information about a resource or associations between resources. For example a comment or a tag on a single web page or image.
- **Article:** A piece of writing of users about trading and investment. Articles have a title and meant to be somewhat longer.
- **Asset:** Assets describe investments of trading users which are physically held in the platform.
- **Basic User:** A basic user is a user who can use all the functionality of the system other than making real investments.
- **Comment:** Comments can be written below articles or trading equipments by users to share their ideas.
- **Economic Event (Event):** Economic events are important incidents that may effect the economy, such as publication of an economical statistic or figure, a speech of an economic leader, a government's bond auction etc. An event's importance level designated with an integer from 1 to 3.
- **Guest:** A user who is using the platform but has not signed up yet.
- **Investment:** Two types of investments exists in the platform. One is the type of investments that are manually entered by users, and other is the assets that are physically held in the platform.
- **Parity:** A pair of trading equipments. Parities describe a valid conversion from one equipment type to another.
- **Password:** A string of characters that allows access to the system. Passwords are at least 8 characters long, can include letters, digits and special characters.
- **Portfolio:** A collection of parities the user selects to follow them together.
- **Sign up:** Registering to the system by providing the necessary information.
- **Trading equipment (Equipment):** Any valuable in which users can invest, such as: indices, stocks, ETFs, commodities, currencies, funds, bonds and cryptocurrencies. A trading equipment does not have a price by itself, price of equipments are only existent within a parity.
- **Trading User (Trader):** In addition to basic users, trading users are able to buy and sell trading equipment on the platform.

# 1. Functional Requirements

## 1.1. User Requirements

Before getting into user requirements it is necessary to define different user types of the system. The system has 4 types of users: **Guest**, **Basic User**, **Trading User (Trader)** and **Admin**. The roles of these user types are briefly explained in the [glossary](#glossary) and will be defined explicitly throughout the following requirements.

In this section, the word "user" will refer to any user of types **Basic User**, **Trader** or **Admin**. The words "guest", "trader" or "admin" will be used when a requirement is specific to only one type of user.

The reader is highly encouraged to read the [glossary](#glossary) before reading the requirements as the meanings of terms used in this document might differ from the common knowledge. The reader may also visit [[User Types]] to see a summary of "who can do what".

### 1.1.1. Sign Up

- **1.1.1.1.** Guests shall be able to sign up by providing their e-mail address, name, surname, location and choosing a [password](#glossary). If the guests wants to register as a trading user, they shall also provide [IBAN](https://en.wikipedia.org/wiki/International_Bank_Account_Number) of their bank account. Location information shall be given using Google Maps.

- **1.1.1.2.** Guests should be able to sign up with their Google account.

### 1.1.2. Sign In

- **1.1.2.1.** Users shall be able to sign in with their e-mail and password.
- **1.1.2.2.** Users should be able to sign in with their Google account.

### 1.1.3. Profile

- **1.1.3.1.** Each user shall have a profile page.
- **1.1.3.2.** Users' prediction success rate for each parity shall be visible on their profile page. There should be a lower limit to the number of predictions for the success rate to be visible on the profile page.
- **1.1.3.3.** Users' public portfolios shall be shown on their profile page.
- **1.1.3.4.** Users shall be able to set their profile to be public or private.
- **1.1.3.5.** Public profiles shall be visible to all users and guests.
- **1.1.3.6.** If a user profile is private, then the content produced by that user shall only be visible to its followers.
- **1.1.3.7.** Prediction success rate shall be visible to all users and guests even if a user's profile is private.

### 1.1.4. Social Interactions and Communication

- **1.1.4.1.** Users shall be able to follow each other. To follow a user who set his profile to be private, a follow request shall be sent first.
- **1.1.4.2.** Users shall be able to deny the following requests came from other users.
- **1.1.4.3.** Users shall be able to share their ideas as an article.
- **1.1.4.4.** Users shall be able to write comments below the articles of other users.
- **1.1.4.5.** Users shall be able to rate articles of other users by clicking the "like" button.
- **1.1.4.6.** Users shall be able to write comments about trading equipment.

### 1.1.5. Economic Events

- **1.1.5.1.** Users and guests shall have an “Events” section. In this section, users and guests shall be able to view economic events as a table with columns: 'time', 'importance level', 'country base', 'actual', 'previous' and 'forecast'. [See example](https://www.investing.com/economic-calendar/).
- **1.1.5.2.** Users and guests should be able to filter economic events by their importance level and country base.
- **1.1.5.3.** Users and guests should be able to search for economic events.
- **1.1.5.4.** Users shall be able to follow economic events. A user who is following an event should be notified after the event happened.

### 1.1.6. Portfolios

- **1.1.6.1.** Users shall have one or more portfolios. Empty portfolios may exist.
- **1.1.6.2.** Users shall be able to rename their portfolios.
- **1.1.6.3.** Users shall be able to add or remove parities from their portfolios.
- **1.1.6.4.** Users shall be able to follow each other's portfolios. Followed portfolios shall be shown in user's portfolios section.

### 1.1.7. Trading Equipment and Parities

- **1.1.7.1.** Users and guests shall be able to view conversion ratio, previous close, percentage and amount change according to the previous close, day's range and moving averages for a parity.
- **1.1.7.2.** Users and guests shall be able to read user comments about trading equipment.
- **1.1.7.3.** Users shall be able to make predictions about the parities for the day. A prediction shall be either "will increase" or "will decrease". The result of the prediction is determined by comparing the last close and today's close of the ratio.
- **1.1.7.4.** Users shall be able to set alerts for certain ratios of parities. Users shall be notified when the target ratio is met.

### 1.1.8. Investments

- **1.1.8.1.** Users shall have a "My Investments" section which contains information about their assets that are physically held in the platform and also manual investments which they made outside of the platform.
- **1.1.8.2.** Users shall be able to enter manual investments.
- **1.1.8.3.** Traders shall have to verify their e-mail address before making an investment.
- **1.1.8.4.** Traders shall be able to buy trading equipment by selling another equipment from their assets if a conversion exists between those equipments. For example, a trader could sell Turkish liras (TRY) to buy United States dollars (USD) whereas he couldn't directly convert his golds to Apple stocks because such a conversion does not exist.
- **1.1.8.5.** Traders shall also have an option of paying with a credit card instead of selling their assets when making an investment.
- **1.1.8.6.** Traders shall be able to give buy orders for a desired ratio. When the current price goes below the desired ratio, the system shall make the buy automatically.
- **1.1.8.7.** Traders shall be able to give stop/loss orders by specifying a maximum loss. The system shall automatically reverse the investment when the amount of lost goes above the maximum loss.

### 1.1.9. Profit/Loss

- **1.1.9.1.** Users shall have a profit/loss section. They shall be able to see their profit/loss amount in the currency of their choice. Users' manual investments and assets shall be both accounted when calculating their profit/loss.
- **1.1.9.2.** Users and guests shall not be able to see the profit/loss of other users.

### 1.1.10. Search

- **1.1.10.1.** Users and guests shall be able to search for trading equipment, parities and other users. The search algorithm shall consider all information available in user profiles (such as portfolios) and shall retrieve semantically similar results to the query.
- **1.1.10.2.** Users and guests shall be able to filter users around a location when searching.

### 1.1.11. Recommendations

- **1.1.11.1.** Users shall receive article and trading equipment recommendations based on their investments, users and events they follow.

### 1.1.12. Admin Panel

- **1.1.12.1.** Admins shall have an admin panel to administrate the platform.
- **1.1.12.2.** Admins shall be able to add new trading equipment and parities.
- **1.1.12.3.** Admins shall be able to ban or delete users. Banned users shall not be able to sign in.
- **1.1.12.4.** Admins shall be able to delete articles and comments.
- **1.1.12.5.** Admins shall be able to add or delete events.

## 1.2. System Requirements

### 1.2.1. Interactions

- **1.2.1.1.** The system shall support sharing ideas as an article.
- **1.2.1.2.** The system shall support commenting and rating ideas of other users.
- **1.2.1.3.** The system shall support commenting about trading equipment.
- **1.2.1.4.** The system shall let users follow other users and trading equipment.
- **1.2.1.5.** The system shall provide an alert mechanism which lets traders to get notified about certain levels of trading equipment.
- **1.2.1.6.** The system shall provide an alert mechanism which lets users to get notified about other users activities, when they follow another user.

### 1.2.2. Recommendation

- **1.2.2.1.** The system shall provide a recommendation mechanism recommending articles, portfolio or trading equipment to the users based on their histories.
- **1.2.2.2.** The system shall let users to make predictions about trading equipment.

### 1.2.3. Searching

- **1.2.3.1.** The system shall contain a searching mechanism that lets users to search users, trading equipment and economic events.
- **1.2.3.2.** The searching mechanism shall consider all the information available in user profiles and trading equipment.
- **1.2.3.3.** The system shall allow the semantic search which enables users to make a search by using user defined tags in order to make more specific search.
- **1.2.3.4.** The system shall support location-based search.

### 1.2.4. Trading Equipments and Parities

The system shall support following equipments and possible conversions between them:

- **1.2.4.1.** Trade indices such as S&P 500, Dow 30, DAX...
- **1.2.4.2.** Stocks such as Apple, Alibaba, IBM...
- **1.2.4.3.** ETFs such as SPDR S&P 500, SPDR DJIA, iShares Russel 2000...
- **1.2.4.4.** Commodities such as Gold, Natural Gas, Silver...
- **1.2.4.5.** The application should support chief monetary units in the world. Currencies such as Euro, American Dollar, Turkish Lira...
- **1.2.4.6.** Funds such as Pimko Total Return, Vanguard Total Stock Market Index Fund, American Funds Growth Fund of America...
- **1.2.4.7.** Bonds such as Euro Bund, UK Gild, Japan Government Bond...
- **1.2.4.8.** Cryptocurrencies such as Bitcoin, Ethereum, XRP...

# 2. Non-Functional Requirements

## 2.1. Security

- **2.1.1.** The website and the mobile application shall use secure HTTP ([HTTPS](https://en.wikipedia.org/wiki/HTTPS)) for all transfers.
- **2.1.2.** The website shall be secure against [SQL injection](https://en.wikipedia.org/wiki/SQL_injection), [cross-site scripting](https://en.wikipedia.org/wiki/Cross-site_scripting), and [cross-site request forgery](https://en.wikipedia.org/wiki/Cross-site_request_forgery) attacks.
- **2.1.3.** User passwords shall be stored in the database using a secure hashing algorithm.
- **2.1.4.** The system should backup periodically.

## 2.2. Performance

- **2.2.1.** The system shall be able to handle 1000 HTTP requests per second.
- **2.2.2.** The system shall be capable of serving 1000 users at the same time.
- **2.2.3.** The system shall respond to search queries in less than 3 seconds.

## 2.3. Availability and Accessibility

- **2.3.1.** The website and the mobile application shall be available in English.
- **2.3.2.** The project should work on any web browser.
- **2.3.3.** The application shall work on Android 4.4 and later.
- **2.3.4.** The project shall be provided for both mobile and web platforms.
- **2.3.5.** The system should work 7/24 with no more than 1% downtime.
- **2.3.6.** The project should contain auxiliary features for disabled people.
- **2.3.7.** The system shall use [UTF-8](https://en.wikipedia.org/wiki/UTF-8) character encoding for all texts.

## 2.4. Annotations

- **2.4.1.** The [W3C Web Annotation Data Model](https://www.w3.org/TR/annotation-model/) and [W3C Web Annotation Protocol](https://www.w3.org/TR/annotation-protocol/) shall be used for annotations.

# Project plan

# User Scenarios

## Scenario 1 (Web)
Ahmet recently graduated from university and found a well paid job. He wants to make some money with his little savings because he wants to marry. For that purpose he starts to look websites to invest then he founds TrAiders. Firstly, he registers the site as a Trader user by giving his iban number. He also chooses his location on Google Map while registering. After registering, he logs in and starts to explore. He looks the currency table and looks changes on parities on the main page. Then he goes to profile page and sees that he can update his information. Finally he logges out because it is enough for him today.

## Scenario 2 (Mobile)
\<insert mobile scenario\>

## Evaluation of tools and managing the project

### Backend

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

### Frontend

- **Amazon Web Services:** We use an AWS EC2 instance to deploy the frontend side of our application.
- **React Javascript Framework:** The main framework to implement the Frontend side of the project.
- **Eslint-stylelint** Eslint a tool which applies the rule for AIRBNB code style. It helps to achieve readability for the team.
- **Docker and Docker Compose:** Docker is a platform to build, share, and run applications with containers which helps in therms of flexibility, security, portability, scalability.
- **Travis:** Travis is used to test the commit in terms of styling, compatibility and checks whether the code commited is working properly or not.
- **Prettier:** Automatically formats the code which helps developers saving time and energy.
- **Redux:** Redux is a module which helps the data storing in React. In other words; it helps to fetch data from the api or post data to api in a more secure, consistent way.
- **Visual Studio Code:** The IDE used to coding in React.js environment.

### Mobile
