import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'front/screens/home_screen.dart';
import 'services/auth_service.dart';
import 'services/database_service.dart';

class App extends StatelessWidget {
  final bool supabaseInitialized;
  const App({super.key, this.supabaseInitialized = true});

  @override
  Widget build(BuildContext context) {
    final providers = supabaseInitialized
        ? [
            ChangeNotifierProvider(create: (_) => AuthService()),
            Provider(create: (_) => DatabaseService()),
          ]
        : [
            // fallback empty providers to avoid null errors in UI
            ChangeNotifierProvider(create: (_) => AuthService()),
            Provider(create: (_) => DatabaseService()),
          ];

    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        title: 'My Regatta',
        theme: ThemeData.from(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)),
        home: Builder(builder: (context) {
          return Stack(
            children: [
              const HomeScreen(),
              if (!supabaseInitialized)
                Positioned(
                  left: 0,
                  right: 0,
                  top: 0,
                  child: Container(
                    color: Colors.red.shade700,
                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    child: const SafeArea(
                      child: Text(
                        'Erreur : connexion au backend échouée. Certaines fonctionnalités peuvent ne pas fonctionner.',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
            ],
          );
        }),
      ),
    );
  }
}
