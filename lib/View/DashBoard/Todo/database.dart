import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io' as io;
import 'package:path/path.dart';
import 'package:todo_app/View/DashBoard/Todo/todo_model.dart';

class DataBase{
  static DataBase? _db;
  Future<DataBase?> get db async{
    if(_db != null){
      return _db;
    }
    _db = await initDatabase();
    return _db;
  }

  initDatabase()async{
    io.Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path,'todo.db');
    var db = await openDatabase(path,version: 1,onCreate: _onCreate);
    return db;
  }

  _onCreate(DataBase db,int version)async{
    await db.execute(
      "CREATE TABLE todo (firstName String NOT NULL,lastName String NOT NULL,)",
    );
  }

  Future<TodoModel> insert(TodoModel todoModel, Object map)async{
    var dbClient = await db;
    await dbClient!.insert('todo' as TodoModel,todoModel.toMap());
    return todoModel;
  }

  Future<List<TodoModel>> getNotesList()async{
    var dbClient = await db;
    final List<Map<String ,Object?>> queryResult = await dbClient?.query('todo');
    return queryResult.map((e) =>
        TodoModel.fromMap(e)
    ).toList();
  }

  Future<int> Delete(int id)async{
    var dbClient = await db;
    return await dbClient!.delete(
        'todo',
        where: 'id = ?',
        whereArgs: [id]
    );
  }

  Future<int> update(TodoModel notesModel)async{
    var dbClient = await db;
    return await dbClient!.update(
        'notes',
        TodoModel.toMap(),
        where: 'id = ?',
        whereArgs: [notesModel.id]
    );
  }
}

