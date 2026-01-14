import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/models.dart';
import '../supabase_client.dart';

class RegattasRepository {
  final SupabaseClient _client = SupabaseClientWrapper.client;

  Future<Regatta?> getById(String id) async {
    final res = await _client.from('regattas').select().eq('id', id).maybeSingle();
    if (res == null) return null;
    return Regatta.fromMap(Map<String, dynamic>.from(res as Map));
  }

  Future<List<Regatta>> listOpen() async {
    final res = await _client.from('regattas').select().eq('status', 'open');
    final data = res as List;
    return data.map((e) => Regatta.fromMap(Map<String, dynamic>.from(e as Map))).toList();
  }

  Future<List<Regatta>> listAll() async {
    final res = await _client.from('regattas').select();
    final data = res as List;
    return data.map((e) => Regatta.fromMap(Map<String, dynamic>.from(e as Map))).toList();
  }

  Future<Regatta> create(Map<String, dynamic> values) async {
    final res = await _client.from('regattas').insert(values).select().maybeSingle();
    return Regatta.fromMap(Map<String, dynamic>.from(res as Map));
  }

  Future<Regatta> update(String id, Map<String, dynamic> values) async {
    final res = await _client.from('regattas').update(values).eq('id', id).select().maybeSingle();
    return Regatta.fromMap(Map<String, dynamic>.from(res as Map));
  }

  Future<void> delete(String id) async {
    await _client.from('regattas').delete().eq('id', id).select().maybeSingle();
  }
}
