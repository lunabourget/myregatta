import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/models.dart';
import '../supabase_client.dart';

class GpsRepository {
  final SupabaseClient _client = SupabaseClientWrapper.client;

  Future<List<GpsPosition>> listForRegatta(String regattaId, {int limit = 100}) async {
    final res = await _client.from('gps_positions').select().eq('regatta_id', regattaId).order('timestamp', ascending: false).limit(limit);
    final data = res as List;
    return data.map((e) => GpsPosition.fromMap(Map<String, dynamic>.from(e as Map))).toList();
  }

  Future<List<GpsPosition>> listAll({int limit = 1000}) async {
    final res = await _client.from('gps_positions').select().order('timestamp', ascending: false).limit(limit);
    final data = res as List;
    return data.map((e) => GpsPosition.fromMap(Map<String, dynamic>.from(e as Map))).toList();
  }

  Future<GpsPosition> insert(Map<String, dynamic> values) async {
    final res = await _client.from('gps_positions').insert(values).select().maybeSingle();
    return GpsPosition.fromMap(Map<String, dynamic>.from(res as Map));
  }

  Future<void> delete(String id) async {
    await _client.from('gps_positions').delete().eq('id', id).select().maybeSingle();
  }
}

