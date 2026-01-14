import '../repositories/boats_repository.dart';
import '../models/models.dart';

class BoatsController {
  final BoatsRepository _repo;
  BoatsController(this._repo);

  Future<Boat?> getBoat(String id) => _repo.getById(id);
  Future<List<Boat>> listAllBoats() => _repo.listAll();
  Future<List<Boat>> listByOwner(String ownerId) => _repo.listByOwner(ownerId);
  Future<Boat> createBoat(Boat b) => _repo.create(b.toMap());
  Future<Boat> updateBoat(String id, Map<String, dynamic> updates) => _repo.update(id, updates);
  Future<void> deleteBoat(String id) => _repo.delete(id);
}

