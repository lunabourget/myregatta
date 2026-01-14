import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../services/auth_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _loading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _signIn(AuthService auth) async {
    setState(() => _loading = true);
    try {
      final user = await auth.signInWithEmail(
          _emailController.text.trim(), _passwordController.text);
      if (user == null) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Échec de la connexion')));
      }
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Erreur: $e')));
    } finally {
      setState(() => _loading = false);
    }
  }

  Future<void> _signUp(AuthService auth) async {
    setState(() => _loading = true);
    try {
      final user = await auth.signUpWithEmail(
          _emailController.text.trim(), _passwordController.text);
      if (user == null) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content:
                Text('Inscription effectuée — veuillez vérifier votre e‑mail si nécessaire')));
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Inscription réussie')));
      }
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Erreur: $e')));
    } finally {
      setState(() => _loading = false);
    }
  }

  Future<void> _signOut(AuthService auth) async {
    await auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthService>(context);
    final user = auth.user;

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Regatta'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: _loading
              ? const CircularProgressIndicator()
              : user == null
                  ? SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextField(
                            controller: _emailController,
                            decoration: const InputDecoration(labelText: 'Email'),
                            keyboardType: TextInputType.emailAddress,
                          ),
                          const SizedBox(height: 12),
                          TextField(
                            controller: _passwordController,
                            decoration:
                                const InputDecoration(labelText: 'Mot de passe'),
                            obscureText: true,
                          ),
                          const SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () => _signIn(auth),
                            child: const Text('Se connecter'),
                          ),
                          const SizedBox(height: 8),
                          OutlinedButton(
                            onPressed: () => _signUp(auth),
                            child: const Text('S\'inscrire'),
                          ),
                        ],
                      ),
                    )
                  : Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('Connecté en tant que: ${user.email ?? user.id}'),
                        const SizedBox(height: 12),
                        ElevatedButton(
                          onPressed: () => _signOut(auth),
                          child: const Text('Se déconnecter'),
                        ),
                      ],
                    ),
        ),
      ),
    );
  }
}
