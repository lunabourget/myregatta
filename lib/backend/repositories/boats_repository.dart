import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/models.dart';
import '../supabase_client.dart';

class BoatsRepository {
  final SupabaseClient _client = SupabaseClientWrapper.client;

  Future<Boat?> getById(String id) async {
    final res = await _client.from('boats').select().eq('id', id).maybeSingle();
    if (res == null) return null;
    return Boat.fromMap(Map<String, dynamic>.from(res as Map));
  }

  Future<List<Boat>> listByOwner(String ownerId) async {
    final res = await _client.from('boats').select().eq('owner_id', ownerId);
    final data = res as List;
    return data.map((e) => Boat.fromMap(Map<String, dynamic>.from(e as Map))).toList();
  }

  Future<List<Boat>> listAll() async {
    final res = await _client.from('boats').select();
    final data = res as List;
    return data.map((e) => Boat.fromMap(Map<String, dynamic>.from(e as Map))).toList();
  }

  Future<Boat> create(Map<String, dynamic> values) async {
    final res = await _client.from('boats').insert(values).select().maybeSingle();
    return Boat.fromMap(Map<String, dynamic>.from(res as Map));
  }

  Future<Boat> update(String id, Map<String, dynamic> values) async {
    final res = await _client.from('boats').update(values).eq('id', id).select().maybeSingle();
    return Boat.fromMap(Map<String, dynamic>.from(res as Map));
  }

  Future<void> delete(String id) async {
    await _client.from('boats').delete().eq('id', id).select().maybeSingle();
  }
}
