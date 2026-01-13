import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'backend/supabase_client.dart';
import 'app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  await SupabaseClientWrapper.init();
  runApp(const App());
}

// Les widgets précédents ne sont plus utilisés directement par main,
// mais on garde MyApp/MyHomePage si vous souhaitez les réutiliser plus tard.
