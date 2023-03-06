# MyFM App

Build an app where you can manage your Football Manager teams from your pocket.

---

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

---

## To be done

- Add isOnLOan (and loanTo) to player model
- Instead of number of players in national team put value of squad (or maybe put that in finances container, I want to replace the nation team players)

---

## Models

### Users
When you open the app for the first time, the first thing you need to do is to create your profile. For that, you need a name, a country, and a birthdate.


    CREATE TABLE Users(
        id INTEGER PRIMARY KEY, 
        name TEXT NOT NULL, 
        country TEXT NOT NULL, countryFlag TEXT NOT NULL, 
        birthdate TEXT NOT NULL,
        imgPath TEXT DEFAULT null,
    );


### Teams
To create a team, you need to fill some attributtes. The first 3 (name, country and year) are required and the rest are optional.  


    CREATE TABLE Teams(
        id INTEGER PRIMARY KEY, 
        name TEXT NOT NULL, 
        country TEXT NOT NULL, countryFlag TEXT NOT NULL, 
        year TEXT NOT NULL,
        league TEXT,
        stadium TEXT,
        transferBudget INTEGER DEFAULT 0 NOT NULL,
        wageBudget INTEGER DEFAULT 0 NOT NULL,
        color TEXT DEFAULT 0xFFFFFFFF NOT NULL,
        imgBadgePath TEXT,
        imgStadiumPath TEXT,
    );


### Player
To create a player, you need to fill some attributtes. The first 4 (name, nation, birthdate and primaryPosition) are required and the rest are optional.  


    CREATE TABLE Players(
        id INTEGER PRIMARY KEY,
        teamId INTEGER NOT NULL, 
        name TEXT NOT NULL, 
        nation TEXT NOT NULL, nationFlag TEXT NOT NULL, 
        birthdate TEXT NOT NULL,
        primaryPosition TEXT NOT NULL,
        secondaryPosition TEXT,
        leftFoot INTEGER NOT NULL, rightFoot INTEGER NOT NULL,
        value INTEGER DEFAULT 0 NOT NULL,
        wage INTEGER DEFAULLT 0 NOT NULL,
        releaseClause INTEGER,
        ability REAL, 
        potential REAL,
        isNationalTeam INTEGER DEFAULT 0 NOT NULL,
        isLoaned INTEGER DEFAULT 0 NOT NULL,
        loanFrom TEXT, 
        imgPath TEXT,
    );

---

## Screens

### Home

To be done

### Teams

On going...

### Favourites

To be done

### Settings

To be done

### About us

To be done