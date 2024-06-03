import 'package:sqflite/sqflite.dart' as sql;

class SQLHelper {
  static Future<void> createTables(sql.Database database) async {
    await database.execute("""
      CREATE TABLE `data_kontak` (
        `id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        `name` TEXT,
        `number` INTEGER,
        `email` TEXT,
        `category` INTEGER,
        `notes` TEXT
      )
    """);
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase(
      'cont.db',
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createTables(database);
      },
    );
  }

  static Future<int> createData(
    String name, 
    int number, 
    String email, 
    int category, 
    String notes
  ) async {
    final db = await SQLHelper.db();
    final data = {
      'name': name, 
      'number': number,
      'email': email, 
      'category': category,
      'notes': notes
    };
    final id = await db.insert('data_kontak', data, conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  static Future<List<Map<String, dynamic>>> getAllData() async {
    final db = await SQLHelper.db();
    return db.query('data_kontak', orderBy: 'id');
  }

  static Future<int> updateData(
    int id, 
    String name, 
    int number,
    String email, 
    int category,
    String notes
  ) async {
    final db = await SQLHelper.db();

    final data = {
      'name': name, 
      'number': number,
      'email': email, 
      'category': category,
      'notes': notes
    };

    final result = await db.update('data_kontak', data, where: "id = ?", whereArgs: [id]);
    return result;
  }

  static Future<void> deleteData(int id) async {
    final db = await SQLHelper.db();
    try {
      await db.delete("data_kontak", where: "id = ?", whereArgs: [id]);
    } catch (err) {
      print("Something went wrong when deleting an item: $err");
    }
  }
}
