import 'package:supabase_flutter/supabase_flutter.dart';
import '../backend/supabase_client.dart';

class DatabaseService {
  final SupabaseClient _client = SupabaseClientWrapper.client;

  Future<List<Map<String, dynamic>>> getRegattas() async {
    final res = await _client.from('regattas').select();
    return List<Map<String, dynamic>>.from(res as List);
  }

  Future<Map<String, dynamic>> createRegatta(Map<String, dynamic> values) async {
    final res = await _client.from('regattas').insert(values).select().maybeSingle();
    return Map<String, dynamic>.from(res as Map);
  }
}
