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

## Models

### Users
When you open the app for the first time, the first thing you need to do is to create your profile. For that, you need a name, a country, and a birthdate.


    CREATE TABLE Users(
        id INTEGER PRIMARY KEY, 
        name TEXT NOT NULL, 
        country TEXT NOT NULL, 
        birthdate TEXT NOT NULL
    );