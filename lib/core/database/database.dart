import 'package:sqflite/sqflite.dart';

class DatabaseShow {
  static const String tableName = 'notes';
  static const String tableUsername = 'users';

  Database? _db;

  Future<Database> get databaseget async {
    if (_db != null) {
      print("is arealdy open ");
      return _db!;
    } else {
      _db = await startDatabase();
      print("is  open  new ");
      return _db!;
    }
  }

  Future<Database?> startDatabase() async {
    final path = getDatabasesPath();
    final pathName = ('$path/notes.db');

    return await openDatabase(
      pathName,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
            'CREATE TABLE notes (id INTEGER PRIMARY KEY AUTOINCREMENT , title TEXT, content TEXT , user_id INTEGER , '
                '  FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE)');
        await db.execute(
            'CREATE TABLE users (id INTEGER PRIMARY KEY AUTOINCREMENT , username TEXT UNIQUE)');
      },
    );
  }

  Future  <int?> ForRegisterUser(Map<String, dynamic> un) async {
    final Ndb = await databaseget;
    try{
    return await Ndb.insert(tableUsername, un);
  }
  catch(e){print(e.toString());
    return null ; }}

  Future<int?> ForLoginUser(String un) async {
    final Ndb = await databaseget;
    final result =
        await Ndb.query(tableUsername, where: 'username=?', whereArgs: [un]);
    if (result.isNotEmpty) {
      return result.first['id'] as int;
    } else {
      return null;
    }
  }

  Future<List<Map<String, dynamic>>> getNotesByUserId(int UserId) async {
    final Ndb = await databaseget;
    return await Ndb.query(
      'notes',
      where: 'user_id = ?',
      whereArgs: [UserId]);
  }

  Future insertNotes(Map<String, dynamic> newNote) async {
    final Ndb = await databaseget;
    print('insert this notes $newNote ');
    return await Ndb.insert(tableName, newNote);
  }

/*

  Future<List<Map<String, dynamic>>> getallNotes() async {
    print('get all  this notes  ');
    final Ndb = await databaseget;
    return await Ndb.query(tableName);
  }

 */

  Future<int> deleteNote(int id) async {
    final Ndb = await databaseget;
    print("delte note");
    return await Ndb.delete(tableName, where: 'id=?', whereArgs: [id]);
  }
}
