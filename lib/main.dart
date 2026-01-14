import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'backend/supabase_client.dart';
import 'app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  debugPrint('main: starting');

  await dotenv.load();
  debugPrint('main: dotenv loaded');

  bool supabaseInitialized = false;
  try {
    debugPrint('main: initializing supabase');
    await SupabaseClientWrapper.init().timeout(const Duration(seconds: 10));
    supabaseInitialized = true;
    debugPrint('main: supabase initialized');
  } catch (e, st) {
    debugPrint('Warning: Supabase initialization failed: $e');
    debugPrint('Stack: $st');
    supabaseInitialized = false;
  }

  debugPrint('main: running app (supabaseInitialized=$supabaseInitialized)');
  runApp(App(supabaseInitialized: supabaseInitialized));
}