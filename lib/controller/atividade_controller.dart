import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

final atividadeTable = "atividadeTable";
final String idAtivColumn = "idAtivColumn";
final String nomeAtivColumn = "nomeAtivColumn";
final String diaSemanaColumn = "diaSemanaColumn";
final String horarioColumn = "horarioColumn";
final String descricaoColumn = "descricaoColumn";

class AtividadeController {
  static final AtividadeController _instance = AtividadeController.internal();

  factory AtividadeController() => _instance;

  AtividadeController.internal();

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
    final path = join(databasesPath, "atividade.db");

    return await openDatabase(path, version: 1,
        onCreate: (Database db, int newerVersion) async {
      await db.execute(
          "CREATE TABLE $atividadeTable ($idAtivColumn INTEGER PRIMARY KEY, $nomeAtivColumn TEXT,"
          "$diaSemanaColumn TEXT, $horarioColumn TEXT, $descricaoColumn TEXT)");
    });
  }

  Future<Atividade> saveAtividade(Atividade atividade) async {
    Database dbAtividade = await db;
    atividade.idAtividade =
        await dbAtividade.insert(atividadeTable, atividade.toMap());
    return atividade;
  }

  Future<Atividade> getAtividade(int id) async {
    Database dbAtividade = await db;
    List<Map> maps = await dbAtividade.query(atividadeTable,
        columns: [
          idAtivColumn,
          nomeAtivColumn,
          diaSemanaColumn,
          horarioColumn,
          descricaoColumn
        ],
        where: "$idAtivColumn = ?",
        whereArgs: [id]);
    if (maps.length > 0) {
      return Atividade.fromMap(maps.first);
    } else {
      return null;
    }
  }


  Future<int> deleteAtividade(int id) async {
    Database dbAtividade = await db;
    return await dbAtividade
        .delete(atividadeTable, where: "$idAtivColumn = ?", whereArgs: [id]);
  }

  Future<int> updateAtividade(Atividade atividade) async {
    Database dbAtividade = await db;
    return await dbAtividade.update(atividadeTable, atividade.toMap(),
        where: "$idAtivColumn = ?", whereArgs: [atividade.idAtividade]);
  }

  Future<List> getAllAtividade() async {
    Database dbAtividade = await db;
    List listMap = await dbAtividade.rawQuery("SELECT * FROM $atividadeTable");
    List<Atividade> listAtividade = List();
    for (Map m in listMap) {
      listAtividade.add(Atividade.fromMap(m));
    }
    return listAtividade;
  }

  Future<int> getNumber() async {
    Database dbAtividade = await db;
    return Sqflite.firstIntValue(
        await dbAtividade.rawQuery("SELECT COUNT(*) FROM $atividadeTable"));
  }

  //fecha conexão do banco de dados
  Future close() async {
    Database dbAtividade = await db;
    dbAtividade.close();
  }
}

class Atividade {
  int idAtividade;
  String nomeAtividade;
  String diaSemana;
  String horario;
  String descricao;

  Atividade();

  Atividade.fromMap(Map map) {
    idAtividade = map[idAtivColumn];
    nomeAtividade = map[nomeAtivColumn];
    diaSemana = map[diaSemanaColumn];
    horario = map[horarioColumn];
    descricao = map[descricaoColumn];
  }

  Map toMap() {
    Map<String, dynamic> map = {
      nomeAtivColumn: nomeAtividade,
      diaSemanaColumn: diaSemana,
      horarioColumn: horario,
      descricaoColumn: descricao
    };
    if (idAtividade != null) {
      map[idAtivColumn] = idAtividade;
    }
    return map;
  }

  @override
  String toString() {
    return "Atividade(idAtividade: $idAtividade, nomeAtividade: $nomeAtividade, "
        "diaSemana: $diaSemana, horario: $horario, descricao: $descricao)";
  }
}
