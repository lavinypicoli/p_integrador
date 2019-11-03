import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

final String avisoTable = "avisoTable";
final String idAvisoColumn = "idAvisoColumn";
final String textopubliColumn = "textopubliColumn";
final String diapubliColumn = "diapubliColumn";
final String horapubliColumn = "horapubliColumn";

class AvisoController {
  static final AvisoController _intance = AvisoController.internal();

  factory AvisoController() => _intance;

  AvisoController.internal();

  Database _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    } else {
      _db = await initDb();
      return _db;
    }
  }

  //cria o banco na primeira vez
  Future<Database> initDb() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, "aviso.db");

    return await openDatabase(path, version: 1,
        onCreate: (Database db, int newerVersion) async {
      await db.execute(
          "CREATE TABLE $avisoTable ($idAvisoColumn INTEGER PRIMARY KEY, $textopubliColumn TEXT,"
          "$diapubliColumn TEXT, $horapubliColumn TEXT)");
    });
  }

  Future<Aviso> saveAviso(Aviso aviso) async {
    Database dbAviso = await db;
    aviso.idAviso = await dbAviso.insert(avisoTable, aviso.toMap());
    return aviso;
  }

  Future<Aviso> getAviso(int id) async {
    Database dbAviso = await db;
    List<Map> maps = await dbAviso.query(avisoTable,
        columns: [
          idAvisoColumn,
          textopubliColumn,
          diapubliColumn,
          horapubliColumn,
        ],
        where: "$idAvisoColumn = ?",
        whereArgs: [id]);
    if (maps.length > 0) {
      return Aviso.fromMap(maps.first);
    } else {
      return null;
    }
  }

  Future<int> deleteAviso(int id) async {
    Database dbAviso = await db;
    return await dbAviso
        .delete(avisoTable, where: "$idAvisoColumn = ?", whereArgs: [id]);
  }

  Future<int> updateAviso(Aviso aviso) async {
    Database dbAviso = await db;
    return await dbAviso.update(avisoTable, aviso.toMap(),
        where: "$idAvisoColumn = ?", whereArgs: [aviso.idAviso]);
  }

  Future<List> getAllAviso() async {
    Database dbAviso = await db;
    List listMap = await dbAviso.rawQuery("SELECT * FROM $avisoTable");
    List<Aviso> listAviso = List();
    for (Map m in listMap) {
      listAviso.add(Aviso.fromMap(m));
    }
    return listAviso;
  }

  Future<int> getNumber() async {
    Database dbAviso = await db;
    return Sqflite.firstIntValue(
        await dbAviso.rawQuery("SELECT COUNT(*) FROM $avisoTable"));
  }

  //fecha conexão do banco de dados
  Future close() async {
    Database dbAviso = await db;
    dbAviso.close();
  }
}

class Aviso {
  int idAviso;
  String textopubli;
  String diapubli;
  String horapubli;

  Aviso();

  Aviso.fromMap(Map map) {
    idAviso = map[idAvisoColumn];
    textopubli = map[textopubliColumn];
    diapubli = map[diapubliColumn];
    horapubli = map[horapubliColumn];
  }

  Map toMap() {
    Map<String, dynamic> map = {
      textopubliColumn: textopubli,
      diapubliColumn: diapubli,
      horapubliColumn: horapubli,
    };
    if (idAviso != null) {
      map[idAvisoColumn] = idAviso;
    }
    return map;
  }

  @override
  String toString() {
    return "Aviso(idAviso: $idAviso, textopubli: $textopubli, diapubli: $diapubli, horapubli: $horapubli)";
  }
}
