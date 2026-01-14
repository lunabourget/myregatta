import '../repositories/profiles_repository.dart';
import '../models/models.dart';

class ProfilesController {
  final ProfilesRepository _repo;

  ProfilesController(this._repo);

  Future<Profile?> getProfile(String id) async {
    return await _repo.getById(id);
  }

  Future<Profile> createProfile(Profile p) async {
    final map = p.toMap();
    return await _repo.create(map);
  }

  Future<Profile> updateProfile(String id, Map<String, dynamic> updates) async {
    return await _repo.update(id, updates);
  }
}

