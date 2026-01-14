import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/models.dart';
import '../supabase_client.dart';

class RegistrationsRepository {
  final SupabaseClient _client = SupabaseClientWrapper.client;

  Future<Registration?> getById(String id) async {
    final res = await _client.from('registrations').select().eq('id', id).maybeSingle();
    if (res == null) return null;
    return Registration.fromMap(Map<String, dynamic>.from(res as Map));
  }

  Future<List<Registration>> listAll() async {
    final res = await _client.from('registrations').select();
    final data = res as List;
    return data.map((e) => Registration.fromMap(Map<String, dynamic>.from(e as Map))).toList();
  }

  Future<Registration> create(Map<String, dynamic> values) async {
    final res = await _client.from('registrations').insert(values).select().maybeSingle();
    return Registration.fromMap(Map<String, dynamic>.from(res as Map));
  }

  Future<Registration> update(String id, Map<String, dynamic> values) async {
    final res = await _client.from('registrations').update(values).eq('id', id).select().maybeSingle();
    return Registration.fromMap(Map<String, dynamic>.from(res as Map));
  }

  Future<void> delete(String id) async {
    await _client.from('registrations').delete().eq('id', id).select().maybeSingle();
  }
}