import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/task_item.dart';

class TaskRepository {
  static const _databaseName = 'task_manager.db';
  static const _tableName = 'tasks';

  Database? _database;

  Future<Database> get _db async {
    final currentDatabase = _database;
    if (currentDatabase != null) return currentDatabase;

    final databasePath = await getDatabasesPath();
    final database = await openDatabase(
      join(databasePath, _databaseName),
      version: 1,
      onCreate: _createDatabase,
    );
    _database = database;
    return database;
  }

  Future<void> _createDatabase(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $_tableName(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT NOT NULL,
        description TEXT NOT NULL,
        icon_key TEXT NOT NULL,
        is_completed INTEGER NOT NULL DEFAULT 0
      )
    ''');

    final batch = db.batch();
    for (final task in _initialTasks) {
      batch.insert(_tableName, task.toMap()..remove('id'));
    }
    await batch.commit(noResult: true);
  }

  Future<List<TaskItem>> getTasks() async {
    final db = await _db;
    final rows = await db.query(_tableName, orderBy: 'id ASC');
    return rows.map(TaskItem.fromMap).toList();
  }

  Future<void> updateTask(TaskItem task) async {
    final taskId = task.id;
    if (taskId == null) {
      throw ArgumentError.value(task, 'task', 'A saved task must have an id.');
    }

    final db = await _db;
    await db.update(
      _tableName,
      task.toMap()..remove('id'),
      where: 'id = ?',
      whereArgs: [taskId],
    );
  }

  static const _initialTasks = [
    TaskItem(
      id: null,
      title: 'Làm bài tập Flutter',
      description: 'Hoàn thành trước thứ Sáu',
      iconKey: 'laptop',
      isCompleted: false,
    ),
    TaskItem(
      id: null,
      title: 'Ôn tập Riverpod',
      description: 'Xem lại bài giảng MVVM',
      iconKey: 'menu_book',
      isCompleted: false,
    ),
    TaskItem(
      id: null,
      title: 'Chuẩn bị bài thuyết trình',
      description: 'Nhóm 4 - Chủ đề Firebase',
      iconKey: 'desktop_windows',
      isCompleted: false,
    ),
    TaskItem(
      id: null,
      title: 'Viết báo cáo môn học',
      description: 'Nộp trên LMS',
      iconKey: 'article',
      isCompleted: false,
    ),
  ];
}
