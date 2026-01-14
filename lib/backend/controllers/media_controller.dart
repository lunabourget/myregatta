import '../repositories/media_repository.dart';
import '../models/models.dart';

class MediaController {
  final MediaRepository _repo;
  MediaController(this._repo);

  Future<List<MediaItem>> listForRegatta(String regattaId) => _repo.listForRegatta(regattaId);
  Future<List<MediaItem>> listAllMedia() => _repo.listAll();
  Future<MediaItem> createMedia(MediaItem m) => _repo.create(m.toMap());
  Future<MediaItem> updateMedia(String id, Map<String, dynamic> updates) => _repo.update(id, updates);
  Future<void> deleteMedia(String id) => _repo.delete(id);
}

