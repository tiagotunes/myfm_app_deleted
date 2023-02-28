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

---

## Models

### Users
When you open the app for the first time, the first thing you need to do is to create your profile. For that, you need a name, a country, and a birthdate.


    CREATE TABLE Users(
        id INTEGER PRIMARY KEY, 
        name TEXT NOT NULL, 
        country TEXT NOT NULL, 
        birthdate TEXT NOT NULL,
        imgPath TEXT DEFAULT null,
    );


### Teams
To create a team, you need to fill some attributtes. The first 3 are required and the rest are optional.  


    CREATE TABLE Teams(
        id INTEGER PRIMARY KEY, 
        name TEXT NOT NULL, 
        country TEXT NOT NULL, 
        year TEXT NOT NULL,
        league TEXT,
        stadium TEXT,
        transferBudget INTEGER DEFAULT 0 NOT NULL,
        wageBudget INTEGER DEFAULT 0 NOT NULL,
        color TEXT DEFAULT 0xFFFFFFFF NOT NULL,
        imgBadgePath TEXT,
        imgStadiumPath TEXT,
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