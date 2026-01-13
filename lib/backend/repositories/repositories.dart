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

  Future<Profile> create(Map<String, dynamic> values) async {
    final res = await _client.from('profiles').insert(values).select().maybeSingle();
    return Profile.fromMap(Map<String, dynamic>.from(res as Map));
  }

  Future<Profile> update(String id, Map<String, dynamic> values) async {
    final res = await _client.from('profiles').update(values).eq('id', id).select().maybeSingle();
    return Profile.fromMap(Map<String, dynamic>.from(res as Map));
  }
}

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

  Future<Boat> create(Map<String, dynamic> values) async {
    final res = await _client.from('boats').insert(values).select().maybeSingle();
    return Boat.fromMap(Map<String, dynamic>.from(res as Map));
  }
}

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

  Future<Regatta> create(Map<String, dynamic> values) async {
    final res = await _client.from('regattas').insert(values).select().maybeSingle();
    return Regatta.fromMap(Map<String, dynamic>.from(res as Map));
  }
}

class RegistrationsRepository {
  final SupabaseClient _client = SupabaseClientWrapper.client;

  Future<Registration?> getById(String id) async {
    final res = await _client.from('registrations').select().eq('id', id).maybeSingle();
    if (res == null) return null;
    return Registration.fromMap(Map<String, dynamic>.from(res as Map));
  }

  Future<Registration> create(Map<String, dynamic> values) async {
    final res = await _client.from('registrations').insert(values).select().maybeSingle();
    return Registration.fromMap(Map<String, dynamic>.from(res as Map));
  }
}

class GpsRepository {
  final SupabaseClient _client = SupabaseClientWrapper.client;

  Future<List<GpsPosition>> listForRegatta(String regattaId, {int limit = 100}) async {
    final res = await _client.from('gps_positions').select().eq('regatta_id', regattaId).order('timestamp', ascending: false).limit(limit);
    final data = res as List;
    return data.map((e) => GpsPosition.fromMap(Map<String, dynamic>.from(e as Map))).toList();
  }

  Future<GpsPosition> insert(Map<String, dynamic> values) async {
    final res = await _client.from('gps_positions').insert(values).select().maybeSingle();
    return GpsPosition.fromMap(Map<String, dynamic>.from(res as Map));
  }
}

class MediaRepository {
  final SupabaseClient _client = SupabaseClientWrapper.client;

  Future<List<MediaItem>> listForRegatta(String regattaId) async {
    final res = await _client.from('media').select().eq('regatta_id', regattaId).order('created_at', ascending: false);
    final data = res as List;
    return data.map((e) => MediaItem.fromMap(Map<String, dynamic>.from(e as Map))).toList();
  }

  Future<MediaItem> create(Map<String, dynamic> values) async {
    final res = await _client.from('media').insert(values).select().maybeSingle();
    return MediaItem.fromMap(Map<String, dynamic>.from(res as Map));
  }
}

class PostsRepository {
  final SupabaseClient _client = SupabaseClientWrapper.client;

  Future<List<Post>> listForRegatta(String regattaId) async {
    final res = await _client.from('posts').select().eq('regatta_id', regattaId).order('created_at', ascending: false);
    final data = res as List;
    return data.map((e) => Post.fromMap(Map<String, dynamic>.from(e as Map))).toList();
  }

  Future<Post> create(Map<String, dynamic> values) async {
    final res = await _client.from('posts').insert(values).select().maybeSingle();
    return Post.fromMap(Map<String, dynamic>.from(res as Map));
  }
}
