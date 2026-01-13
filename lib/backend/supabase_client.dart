import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class SupabaseClientWrapper {
  static bool _initialized = false;

  static Future<void> init() async {
    if (_initialized) return;

    final url = dotenv.env['SUPABASE_URL'];
    final anonKey = dotenv.env['SUPABASE_ANON_KEY'];

    if (url == null || anonKey == null) {
      throw StateError('Supabase URL or ANON key not found in .env');
    }

    await Supabase.initialize(
      url: url,
      anonKey: anonKey,
    );

    _initialized = true;
  }

  static SupabaseClient get client => Supabase.instance.client;
}

