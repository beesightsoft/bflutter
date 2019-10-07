import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:uuid/uuid.dart';

/// Model
class Piece {
  String id = Uuid().v1();
  String prefix = "default";
  String body;

  Piece({String id, String prefix, String body}) {
    if(id != null) this.id = id;
    if(prefix != null) this.prefix = prefix;
    if(body != null) this.body = body;
  }

  factory Piece.fromJson(String prefix, String body) {
    return Piece(prefix: prefix, body: body);
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'prefix': prefix, 'body': body};
  }

  // Implement toString to make it easier to see information about
  // each dog when using the print statement.
  @override
  String toString() {
    return 'Piece{id: $id, prefix: $prefix, body: $body}';
  }
}

class BCache {
  Future<Database> database;

  // @nhancv 10/7/2019: Create api instance
  BCache._private();

  static final BCache _instance = BCache._private();

  factory BCache() => _instance;

  final _tableName = 'cache_data';

  Future<void> init() async {
    database = openDatabase(
      // Set the path to the database. Note: Using the `join` function from the
      // `path` package is best practice to ensure the path is correctly
      // constructed for each platform.
      join(await getDatabasesPath(), 'bcache_database.db'),
      // When the database is first created, create a table to store data.
      onCreate: (db, version) {
        // Data types: https://www.sqlite.org/datatype3.html
        return db.execute(
          'CREATE TABLE $_tableName (id TEXT PRIMARY KEY, prefix TEXT, body TEXT)',
        );
      },
      // Set the version. This executes the onCreate function and provides a
      // path to perform database upgrades and downgrades.
      version: 1,
    );
  }

  Future<void> insert(Piece piece) async {
    // Get a reference to the database.
    final Database db = await database;

    // Insert the data into the correct table. Also specify the
    // `conflictAlgorithm`. In this case, if the same data is inserted
    // multiple times, it replaces the previous data.
    await db.insert(
      _tableName,
      piece.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Piece>> query<T>(String prefix) async {
    // Get a reference to the database.
    final Database db = await database;

    final List<Map<String, dynamic>> results =
        await db.query(_tableName, where: "prefix = ?", whereArgs: [prefix]);

    // Convert the List<Map<String, dynamic> into a List<Dog>.
    return List.generate(results.length, (i) {
      return Piece(
        id: results[i]['id'],
        prefix: results[i]['prefix'],
        body: results[i]['body'],
      );
    });
  }

  Future<void> update(Piece piece) async {
    // Get a reference to the database.
    final db = await database;

    // Update the given data.
    await db.update(
      _tableName,
      piece.toJson(),
      where: "id = ?",
      whereArgs: [piece.id],
    );
  }

  Future<void> delete(String id) async {
    // Get a reference to the database.
    final db = await database;

    // Remove the data from the database.
    await db.delete(
      _tableName,
      where: "id = ?",
      whereArgs: [id],
    );
  }
}

/// Example
//var piece = Piece(
//  body: "body1",
//);
//
//BCache bCache = BCache();
//await bCache.init();
//
//// Insert a piece into the database.
//await bCache.insert(piece);
//
//// Print the list of pieces (only piece for now).
//print(await bCache.query("default"));
//
//// Update piece's body and save it to the database.
//piece.body = "body2";
//await bCache.update(piece);
//
//// Print piece's updated information.
//print(await bCache.query("default"));
//
//// Delete piece from the database.
//await bCache.delete(piece.id);
//
//// Print the list of pieces (empty).
//print(await bCache.query("default"));
