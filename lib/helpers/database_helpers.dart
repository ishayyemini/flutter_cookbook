import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

final String tableRecipes = 'recipes';
final String recipesId = '_id';
final String recipesName = 'name';
final String recipesTotalTime = 'totalTime';

class Recipe {
  int id;
  String name;
  int totalTime;

  Recipe();

  // convenience constructor to create a Word object
  Recipe.fromMap(Map<String, dynamic> map) {
    id = map[recipesId];
    name = map[recipesName];
    totalTime = map[recipesTotalTime];
  }

  // convenience method to create a Map from this Word object
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{recipesName: name, recipesTotalTime: totalTime};
    if (id != null) map[recipesId] = id;
    return map;
  }
}

// singleton class to manage the database
class DatabaseHelper {
  // This is the actual database filename that is saved in the docs directory.
  static final _databaseName = "Recipes.db";
  // Increment this version when you need to change the schema.
  static final _databaseVersion = 1;

  // Make this a singleton class.
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // Only allow a single open connection to the database.
  static Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  // open the database
  _initDatabase() async {
    // The path_provider plugin gets the right directory for Android or iOS.
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    // Open the database. Can also add an onUpdate callback parameter.
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  // SQL string to create the database
  Future _onCreate(Database db, int version) async {
    await db.execute('''
              CREATE TABLE $tableRecipes (
                $recipesId INTEGER PRIMARY KEY,
                $recipesName TEXT NOT NULL,
                $recipesTotalTime INTEGER NOT NULL
              )
              ''');
  }

  // Database helper methods:

  Future<int> insert(Recipe recipe) async {
    Database db = await database;
    int id = await db.insert(tableRecipes, recipe.toMap());
    return id;
  }

  Future<Recipe> queryRecipe(int id) async {
    Database db = await database;
    List<Map> maps = await db.query(tableRecipes,
        columns: [recipesId, recipesName, recipesTotalTime],
        where: '$recipesId = ?',
        whereArgs: [id]);
    if (maps.length > 0) {
      return Recipe.fromMap(maps.first);
    }
    return null;
  }

  Future<List<Recipe>> getAllRecipes() async {
    Database db = await database;
    List<Map> maps = await db.query(tableRecipes);
    List<Recipe> recipes = new List<Recipe>();

    maps.forEach((recipe) => recipes.add(Recipe.fromMap(recipe)));
    return recipes;
  }

// TODO: delete(int id)
// TODO: update(Recipe recipe)
}
