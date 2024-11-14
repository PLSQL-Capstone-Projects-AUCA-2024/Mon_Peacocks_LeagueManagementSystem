# 📗 Table of Contents

- [📖 About the Project](#about-project)
    - [🛠 Built With](#built-with)
        - [Tech Stack](#tech-stack)
        - [Key Features](#key-features)
    - [🚀 Live Demo](#live-demo)
- [💻 Getting Started](#getting-started)
    - [Setup](#setup)
    - [Prerequisites](#prerequisites)
    - [Install](#install)
    - [Usage](#usage)
- [🔭 Future Features](#future-features)
- [🤝 Contributing](#contributing)
- [⭐️ Show your support](#support)
- [🙏 Acknowledgements](#acknowledgements)
- [📝 License](#license)


# 📖 League Management system <a name="about-project"></a>


**League Management System** The League Management System (LMS) is a comprehensive solution designed to assist football associations in efficiently managing league operations. This software streamlines key functions such as team and player registration, match scheduling, referee assignments, and real-time tracking of match results. LMS automates league standings updates, supports player transfers, and ensures accurate, transparent records across the league. With features tailored for administrators, team managers, referees, and coaches, LMS enhances decision-making, fosters collaboration, and promotes seamless communication, ultimately contributing to a more organized and competitive league environment.

## 🛠 Built With <a name="built-with"></a>

### Tech Stack <a name="tech-stack"></a>

<details>
  <ul>
    <li><a href="https://www.oracle.com/database/">Oracle Database 19g</a></li>
    <li><a href="https://www.oracle.com/database/">Draw.io</a></li>
  </ul>
</details>


### Key Features <a name="key-features"></a>
- **Team and Player Registration**: Easily register teams, players, coaches, and referees for each league season.
- **Match Scheduling**: Organize and schedule matches across various stadiums with assigned referees.
- **Real-time Match Results**: Record match scores, incidents, and updates, with automatic calculation of league standings.
- **Player Transfers**: Manage player transfers between teams, with built-in eligibility checks and history tracking.
- **Data Integrity and Validation**: Ensure accurate, error-free data entry and referential integrity across the system.
- **User Roles and Permissions**: Define specific access roles (Admin, Team Manager, Referee) to control access and maintain security.
- **Reports and Insights**: Generate insights and reports for team performance, player statistics, and league analytics.


<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🚀 Live Demo <a name="live-demo"></a>
This project is currently designed for on-premises use and does not have a live demo.
Here is ERD (Logical model) for League Management System
![WhatsApp Image 2024-11-14 at 22 54 03](https://github.com/user-attachments/assets/84bed8d5-1ff0-420e-a434-05fb3cceb602)
![ERD](https://github.com/user-attachments/assets/5c731a52-9bd8-43fb-8c4a-1130bebeca5d)


### Swimlane
A detailed, logical data model for The League Management Sytem  project, incorporating all required entities, attributes, and relationships using SQL Developer.


![LF drawio](https://github.com/user-attachments/assets/39ed2cf0-ee45-443e-ab9a-7718c032d969)

The logical model provided includes primary and foreign keys, as well as other constraints where applicable.
Primary Keys: Match_ID, Team_ID,Player_ID,Season_ID, Stadium_ID,Coach_ID, TeamPlayer_ID, Transfer_ID  

Foreign Keys:FK_MATCH_AWAY_TEAM,FK_MATCH_HOME_TEAM,FK_TEAM_COACH etc.

## EXPLANATION
The Logical data model optimizes data storage and retrieval by organizing information into distinct tables with specific relationships, thereby reducing redundancy and enhancing data retrieval efficiency. Each entity, such as Teams, Players, Matches, Seasons, Stadiums, Transfers, and Coaches, has its own table with primary keys for unique identification and foreign keys that establish connections with related tables. For example, the Matches table references Teams, Stadiums, Referees, and Seasons, which prevents duplication of team and stadium details across multiple match records. The Transfers table handles player movements between teams with foreign keys, ensuring that each transfer record accurately links to players and teams involved. This relational approach minimizes data duplication and enables fast queries, as data is retrieved by joining related tables based on indexed keys rather than scanning large, repetitive datasets. By normalizing the design, it maintains data integrity and consistency, making it scalable and efficient for handling large datasets in sports management scenarios

<p align="right">(<a href="#readme-top">back to top</a>)</p>


## 💻 Getting Started <a name="getting-started"></a>


To get a local copy up and running, follow these steps.

### Prerequisites

In order to run this project you need:

You need to have git installed and the desired code editor (SQL developer or datagrip are recommended)

### Setup

Clone this repository to your desired folder:

```sh
  cd my-folder
  git clone git@github.com:PLSQL-Capstone-Projects-AUCA-2024/Mon_Peacocks_LeagueManagementSystem.git
```

### Usage

To run the project in development mode, execute the following command:

To create tables
```shell
-- 1. Stadiums Table
CREATE TABLE Stadiums
(
    stadium_id       NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    stadium_name     VARCHAR2(100) UNIQUE NOT NULL,
    city             VARCHAR2(50) NOT NULL,
    capacity         NUMBER,
    established_year NUMBER(4)
);

-- 2. Coaches Table
CREATE TABLE Coaches
(
    coach_id         NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    first_name       VARCHAR2(50) NOT NULL,
    last_name        VARCHAR2(50) NOT NULL,
    nationality      VARCHAR2(50),
    experience_years NUMBER
);
  
  Create More tables.....

```


To insert data
```shell
-- 1. Insert sample data into Coaches

INSERT INTO Coaches (first_name, last_name, nationality, experience_years)
VALUES ('Habimana', 'Innocent', 'Rwanda', 12);

INSERT INTO Coaches (first_name, last_name, nationality, experience_years)
VALUES ('Rukundo', 'Samuel', 'Rwanda', 8);

INSERT INTO Coaches (first_name, last_name, nationality, experience_years)
VALUES ('Mukamisha', 'Vestine', 'Rwanda', 5);



-- 2. Insert sample data into Stadiums
INSERT INTO Stadiums (stadium_name, city, capacity, established_year)
VALUES ('Amahoro Stadium', 'Kigali', 25000, 1987);

INSERT INTO Stadiums (stadium_name, city, capacity, established_year)
VALUES ('Nyamirambo Regional Stadium', 'Kigali', 12000, 1986);

INSERT INTO Stadiums (stadium_name, city, capacity, established_year)
VALUES ('Huye Stadium', 'Huye', 8000, 2015);


Insert more values .....

```


<p align="right">(<a href="#readme-top">back to top</a>)</p>


## TEAM MEMBER SCOPE DOCUMENTATION
- MUTESI Ange de Noella: Created and executed SQL commands to insert values, which were instrumental in generating and testing the logical data model within SQL Developer.
- MAYIMANA Divine: Provided a concise yet informative explanation on how swim lanes operate, detailing their role in organizing and visualizing workflows or processes
- UWINEZA Liliane: Delivered a comprehensive and detailed description of the logical data model, explaining its structure and how it supports data relationships within the project
- shema Cyusa Patrick: I defined the overall scope and boundaries of the swim lane diagram, clarifying the processes it should include and the interactions it should depict.
- NSANZIMFURA Enock: Wrote the SQL code required to create tables in SQL Developer, ensuring that the database structure aligned with the project’s design and data requirements.
- KWIZERZA Jean Luc: Drew a swim lane diagram using UML notations, carefully following standardized symbols and conventions to represent different stages and roles within the workflow.
- Kwizera Mackenzie: Reviewed and confirmed the logical flow within the swim lane diagram, ensuring that each step followed a coherent sequence that accurately represented the intended process.
- CHIKELUBA Stanley: Identified the key entities necessary for the project, establishing the foundational elements required for an accurate and functional logical data model.
- KUNDWA Nelly: Verified that the logical data model effectively addressed the primary issue outlined in Phase 1, ensuring the model’s alignment with the initial problem statement and objectives.
- MUGISHA Abdoullatif: Carefully examined the logical data model to ensure that all necessary constraints were applied, enhancing the model’s accuracy and functionality.

<p align="right">(<a href="#readme-top">back to top</a>)</p>


## 🤝 Contributing <a name="contributing"></a>

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](https://github.com/edenlisk/attendance-analysis/issues).

<p align="right">(<a href="#readme-top">back to top</a>)</p>


## ⭐️ Show your support <a name="support"></a>

[comment]: <> (> Write a message to encourage readers to support your project)

If you like this project kindly consider giving ⭐

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🙏 Acknowledgments <a name="acknowledgements"></a>

[comment]: <> (> Give credit to everyone who inspired your codebase.)


<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 📝 License <a name="license"></a>

This project is [MIT](./LICENSE) licensed.

<p align="right">(<a href="#readme-top">back to top</a>)</p>
