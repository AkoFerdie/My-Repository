import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:path/path.dart'; // For join()
import 'package:sqflite/sqflite.dart' as sql;
import 'package:sembast/sembast.dart' as sembast;
import 'package:sembast/sembast_io.dart' as sembast_io;
import 'package:sembast_web/sembast_web.dart' as sembast_web;

class DatabaseService {
  static final DatabaseService _instance = DatabaseService._internal();
  factory DatabaseService() => _instance;
  DatabaseService._internal();

  sql.Database? _sqfliteDb;
  sql.Database? get sqfliteDb => _sqfliteDb;

  sembast.DatabaseFactory? _sembastFactory; // Make nullable
  sembast.Database? _sembastDb;

  final _store = sembast.intMapStoreFactory.store('users');

  bool _initialized = false; // Track if init() already ran

  Future<void> init() async {
    if (_initialized) return; // Prevent multiple initialization
    _initialized = true;

    if (kIsWeb) {
      // Initialize Sembast Web
      _sembastFactory ??= sembast_web.databaseFactoryWeb;
      _sembastDb ??= await _sembastFactory!.openDatabase('users.db');
    } else {
      // Initialize Sqflite for Mobile/Desktop
      final dbPath = await sql.getDatabasesPath();
      final path = join(dbPath, 'users.db');
      _sqfliteDb ??= await sql.openDatabase(
        path,
        version: 1,
        onCreate: (db, version) async {
          await db.execute('''
            CREATE TABLE users(
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              username TEXT NOT NULL,
              email TEXT NOT NULL UNIQUE,
              password TEXT NOT NULL
            )
          ''');
        },
      );
    }
  }

  Future<int> insertUser(Map<String, dynamic> user) async {
    if (kIsWeb) {
      return await _store.add(_sembastDb!, user);
    } else {
      return await _sqfliteDb!.insert('users', user);
    }
  }

  Future<Map<String, dynamic>?> getUser(String emailOrUsername, String password) async {
    if (kIsWeb) {
      final records = await _store.find(
        _sembastDb!,
        finder: sembast.Finder(
          filter: sembast.Filter.or([
            sembast.Filter.and([
              sembast.Filter.equals('email', emailOrUsername),
              sembast.Filter.equals('password', password),
            ]),
            sembast.Filter.and([
              sembast.Filter.equals('username', emailOrUsername),
              sembast.Filter.equals('password', password),
            ])
          ]),
        ),
      );
      return records.isNotEmpty ? records.first.value : null;
    } else {
      final res = await _sqfliteDb!.query(
        'users',
        where: '(email = ? OR username = ?) AND password = ?',
        whereArgs: [emailOrUsername, emailOrUsername, password],
      );
      return res.isNotEmpty ? res.first : null;
    }
  }

  Future<bool> isEmailExist(String email) async {
    if (kIsWeb) {
      final records = await _store.find(
        _sembastDb!,
        finder: sembast.Finder(
          filter: sembast.Filter.equals('email', email),
        ),
      );
      return records.isNotEmpty;
    } else {
      final res = await _sqfliteDb!.query(
        'users',
        where: 'email = ?',
        whereArgs: [email],
      );
      return res.isNotEmpty;
    }
  }
}
