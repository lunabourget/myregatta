import '../repositories/posts_repository.dart';
import '../models/models.dart';

class PostsController {
  final PostsRepository _repo;
  PostsController(this._repo);

  Future<List<Post>> listForRegatta(String regattaId) => _repo.listForRegatta(regattaId);
  Future<List<Post>> listAllPosts() => _repo.listAll();
  Future<Post> createPost(Post p) => _repo.create(p.toMap());
  Future<Post> updatePost(String id, Map<String, dynamic> updates) => _repo.update(id, updates);
  Future<void> deletePost(String id) => _repo.delete(id);
}

