import '../repositories/regattas_repository.dart';
import '../models/models.dart';

class RegattasController {
  final RegattasRepository _repo;

  RegattasController(this._repo);

  Future<List<Regatta>> listOpenRegattas() async {
    return await _repo.listOpen();
  }

  Future<Regatta> createRegatta(Regatta r) async {
    final map = r.toMap();
    return await _repo.create(map);
  }
}

