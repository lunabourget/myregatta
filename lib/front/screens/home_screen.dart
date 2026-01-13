import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../services/auth_service.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthService>(context);
    final user = auth.user;

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Regatta'),
      ),
      body: Center(
        child: user == null
            ? const Text('Not signed in')
            : Text('Signed in as: ' + (user.email ?? 'unknown')),
      ),
    );
  }
}

