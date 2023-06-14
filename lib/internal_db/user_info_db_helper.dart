// import 'dart:developer';

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:path/path.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:sqflite/sqflite.dart';

// import '../model/user_model.dart';

// const String _dbFileName = 'userDatabase.db';

// class UserDbHelper {
//   static final UserDbHelper instance = UserDbHelper._internal();

//   UserDbHelper._internal();

//   static Database? _database;
//   // added a character before uid
//   // to prevent table name starting with a number or a special character
//   final String _tableName =
//       "k${FirebaseAuth.instance.currentUser!.uid}_userInfo";

//   // Get the database instance
//   Future<Database> get database async {
//     return _database ?? await _initDatabase();
//   }

//   // Initialize the database connection
//   Future<Database> _initDatabase() async {
//     final directory = await getApplicationDocumentsDirectory();
//     final path = join(directory.path, _dbFileName);

//     return await openDatabase(
//       path,
//       version: 1,
//       onCreate: (db, version) {
//         return db.execute(
//           '''CREATE TABLE IF NOT EXISTS $_tableName(
//             id INTEGER PRIMARY KEY AUTOINCREMENT, 
//             name TEXT
//             )''',
//         );
//       },
//     );
//   }

//   // Insert a user into the database
//   Future<void> insertUser(UserModel user) async {
//     try {
//       final db = await database;
//       await db.insert(
//         _tableName,
//         UserModel.toMap(user),
//         conflictAlgorithm: ConflictAlgorithm.replace,
//       );
//     } catch (e) {
//       throw Exception(e);
//     }
//   }

//   // Get current user from the database
//   Future<UserModel?> getUser() async {
//     log("=> uid in table: ${FirebaseAuth.instance.currentUser!.uid}");
//     try {
//       final db = await database;
//       final List<Map<String, dynamic>> map = await db.query(_tableName);
//       if (map.isEmpty) return null;
//       return UserModel.fromMap(map.first);
//     } catch (e) {
//       throw Exception(e);
//     }
//   }

//   // Delete a user from the database
//   Future<void> deleteUser(int id) async {
//     final db = await database;
//     await db.delete(
//       _tableName,
//       where: 'id = ?',
//       whereArgs: [id],
//     );
//   }

//   void invalidateDB() async {
//     _database = null;
//   }

//   // Close the database connection
//   Future<void> delete() async {
//     final db = await database;
//     await db.delete(_tableName);
//   }

//   // // Close the database connection
//   // Future<void> close() async {
//   //   final db = await database;
//   //   await db.close();
//   // }
// }
