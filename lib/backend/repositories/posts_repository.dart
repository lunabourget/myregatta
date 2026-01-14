import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/models.dart';
import '../supabase_client.dart';

class PostsRepository {
  final SupabaseClient _client = SupabaseClientWrapper.client;

  Future<List<Post>> listForRegatta(String regattaId) async {
    final res = await _client.from('posts').select().eq('regatta_id', regattaId).order('created_at', ascending: false);
    final data = res as List;
    return data.map((e) => Post.fromMap(Map<String, dynamic>.from(e as Map))).toList();
  }

  Future<List<Post>> listAll() async {
    final res = await _client.from('posts').select().order('created_at', ascending: false);
    final data = res as List;
    return data.map((e) => Post.fromMap(Map<String, dynamic>.from(e as Map))).toList();
  }

  Future<Post> create(Map<String, dynamic> values) async {
    final res = await _client.from('posts').insert(values).select().maybeSingle();
    return Post.fromMap(Map<String, dynamic>.from(res as Map));
  }

  Future<Post> update(String id, Map<String, dynamic> values) async {
    final res = await _client.from('posts').update(values).eq('id', id).select().maybeSingle();
    return Post.fromMap(Map<String, dynamic>.from(res as Map));
  }

  Future<void> delete(String id) async {
    await _client.from('posts').delete().eq('id', id).select().maybeSingle();
  }
}
