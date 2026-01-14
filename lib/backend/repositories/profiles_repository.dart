import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/models.dart';
import '../supabase_client.dart';

class ProfilesRepository {
  final SupabaseClient _client = SupabaseClientWrapper.client;

  Future<Profile?> getById(String id) async {
    final res = await _client.from('profiles').select().eq('id', id).maybeSingle();
    if (res == null) return null;
    return Profile.fromMap(Map<String, dynamic>.from(res as Map));
  }

  Future<List<Profile>> listAll() async {
    final res = await _client.from('profiles').select();
    final data = res as List;
    return data.map((e) => Profile.fromMap(Map<String, dynamic>.from(e as Map))).toList();
  }

  Future<Profile> create(Map<String, dynamic> values) async {
    final res = await _client.from('profiles').insert(values).select().maybeSingle();
    return Profile.fromMap(Map<String, dynamic>.from(res as Map));
  }

  Future<Profile> update(String id, Map<String, dynamic> values) async {
    final res = await _client.from('profiles').update(values).eq('id', id).select().maybeSingle();
    return Profile.fromMap(Map<String, dynamic>.from(res as Map));
  }

  Future<void> delete(String id) async {
    await _client.from('profiles').delete().eq('id', id).select().maybeSingle();
  }
}

