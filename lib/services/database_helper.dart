import 'package:myfm_app/models/team_model.dart';
import 'package:myfm_app/models/user_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static const int _version = 1;
  static const String _dbName = 'myFM.db';

  static Future<Database> _getDB() async {
    return openDatabase(
      join(await getDatabasesPath(), _dbName),
      onCreate: (db, version) async {
        await db.execute(
          "CREATE TABLE Users(id INTEGER PRIMARY KEY, name TEXT NOT NULL, country TEXT NOT NULL, birthdate TEXT NOT NULL, imgPath TEXT);",
        );
        await db.execute(
          "CREATE TABLE Teams(id INTEGER PRIMARY KEY, name TEXT NOT NULL, country TEXT NOT NULL, year INTEGER NOT NULL, league TEXT DEFAULT None NOT NULL, transferBudget INTEGER DEFAULT 0 NOT NULL, wageBudget INTEGER DEFAULT 0 NOT NULL, color TEXT DEFAULT 0xFFFFFFFF NOT NULL, imgBadgePath TEXT, imgStadiumPath TEXT);",
        );
      },
      version: _version,
    );
  }

  ///////////
  // USER //
  /////////

  static Future<int> addUser(User user) async {
    final db = await _getDB();
    return await db.insert(
      'Users',
      user.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<int> updateUser(User user) async {
    final db = await _getDB();
    return await db.update(
      'Users',
      user.toJson(),
      where: 'id = ?',
      whereArgs: [user.id],
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<int> deleteUser(User user) async {
    final db = await _getDB();
    return await db.delete(
      'Users',
      where: 'id = ?',
      whereArgs: [user.id],
    );
  }

  static Future<List<User>?> getAllUsers() async {
    final db = await _getDB();
    final List<Map<String, dynamic>> maps = await db.query('Users');
    if (maps.isEmpty) {
      return null;
    }
    return List.generate(maps.length, (index) => User.fromJson(maps[index]));
  }

  ///////////
  // TEAM //
  /////////

  static Future<int> addTeam(Team team) async {
    final db = await _getDB();
    return await db.insert(
      'Teams',
      team.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<int> updateTeam(Team team) async {
    final db = await _getDB();
    return await db.update(
      'Teams',
      team.toJson(),
      where: 'id = ?',
      whereArgs: [team.id],
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<int> deleteTeam(Team team) async {
    final db = await _getDB();
    return await db.delete(
      'Teams',
      where: 'id = ?',
      whereArgs: [team.id],
    );
  }

  static Future<List<Team>?> getAllTeams() async {
    final db = await _getDB();
    final List<Map<String, dynamic>> maps = await db.query('Teams');
    if (maps.isEmpty) {
      return null;
    }
    return List.generate(maps.length, (index) => Team.fromJson(maps[index]));
  }

  static Future<int> deleteAll() async {
    final db = await _getDB();
    return await db.delete('Users');
  }  
}
