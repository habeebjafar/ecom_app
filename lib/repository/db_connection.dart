import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseConnection{

  initDatabase() async{
    var directory = await getApplicationSupportDirectory();
    var path = join(directory.path, 'db_ecom');
    var database = await openDatabase(path, version: 1, onCreate: _onCreatingDatabase);
    return database;

  }
  _onCreatingDatabase(Database db, int version) async{
    await db.execute(
     "CREATE TABLE carts(id INTEGER PRIMARY KEY, productId INTEGER, productName TEXT, productPhoto TEXT, productPrice TEXT, productDiscount TEXT, productQuantity INTEGER)"
     );
      

  }

}