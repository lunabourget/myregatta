import '../repositories/gps_repository.dart';
import '../models/models.dart';

class GpsController {
  final GpsRepository _repo;
  GpsController(this._repo);

  Future<List<GpsPosition>> listForRegatta(String regattaId, {int limit = 100}) => _repo.listForRegatta(regattaId, limit: limit);
  Future<List<GpsPosition>> listAll({int limit = 1000}) => _repo.listAll(limit: limit);
  Future<GpsPosition> insertPosition(GpsPosition p) => _repo.insert(p.toMap());
  Future<void> deletePosition(String id) => _repo.delete(id);
}

