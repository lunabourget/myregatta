import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../backend/supabase_client.dart';

class AuthService with ChangeNotifier {
  User? _user;

  AuthService() {
    _user = SupabaseClientWrapper.client.auth.currentUser;
    // Listen to auth changes
    try {
      SupabaseClientWrapper.client.auth.onAuthStateChange.listen((dynamic event) {
        // Safely try to extract session from the event; fallback to currentUser
        try {
          final session = (event as dynamic).session;
          _user = session?.user ?? SupabaseClientWrapper.client.auth.currentUser;
        } catch (_) {
          _user = SupabaseClientWrapper.client.auth.currentUser;
        }
        notifyListeners();
      });
    } catch (_) {
      // Fallback: if onAuthStateChange is not a Stream in the current SDK,
      // we silently ignore listener registration. currentUser will still be used.
    }
  }

  User? get user => _user;

  Future<User?> signInWithEmail(String email, String password) async {
    try {
      await SupabaseClientWrapper.client.auth.signInWithPassword(
          email: email, password: password);
      _user = SupabaseClientWrapper.client.auth.currentUser;
      notifyListeners();
      return _user;
    } catch (e) {
      rethrow;
    }
  }

  Future<User?> signUpWithEmail(String email, String password) async {
    try {
      await SupabaseClientWrapper.client.auth.signUp(
        email: email,
        password: password,
      );
      _user = SupabaseClientWrapper.client.auth.currentUser;
      notifyListeners();
      return _user;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> signOut() async {
    await SupabaseClientWrapper.client.auth.signOut();
    _user = null;
    notifyListeners();
  }
}
