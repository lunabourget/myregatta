import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/models.dart';
import '../supabase_client.dart';

class MediaRepository {
  final SupabaseClient _client = SupabaseClientWrapper.client;

  Future<List<MediaItem>> listForRegatta(String regattaId) async {
    final res = await _client.from('media').select().eq('regatta_id', regattaId).order('created_at', ascending: false);
    final data = res as List;
    return data.map((e) => MediaItem.fromMap(Map<String, dynamic>.from(e as Map))).toList();
  }

  Future<List<MediaItem>> listAll() async {
    final res = await _client.from('media').select().order('created_at', ascending: false);
    final data = res as List;
    return data.map((e) => MediaItem.fromMap(Map<String, dynamic>.from(e as Map))).toList();
  }

  Future<MediaItem> create(Map<String, dynamic> values) async {
    final res = await _client.from('media').insert(values).select().maybeSingle();
    return MediaItem.fromMap(Map<String, dynamic>.from(res as Map));
  }

  Future<MediaItem> update(String id, Map<String, dynamic> values) async {
    final res = await _client.from('media').update(values).eq('id', id).select().maybeSingle();
    return MediaItem.fromMap(Map<String, dynamic>.from(res as Map));
  }

  Future<void> delete(String id) async {
    await _client.from('media').delete().eq('id', id).select().maybeSingle();
  }
}
