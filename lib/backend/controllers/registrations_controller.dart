import '../repositories/registrations_repository.dart';
import '../models/models.dart';

class RegistrationsController {
  final RegistrationsRepository _repo;
  RegistrationsController(this._repo);

  Future<Registration?> getRegistration(String id) => _repo.getById(id);
  Future<List<Registration>> listAllRegistrations() => _repo.listAll();
  Future<Registration> createRegistration(Registration r) => _repo.create(r.toMap());
  Future<Registration> updateRegistration(String id, Map<String, dynamic> updates) => _repo.update(id, updates);
  Future<void> deleteRegistration(String id) => _repo.delete(id);
}

