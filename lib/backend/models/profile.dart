import 'enums.dart';
import 'utils.dart';

class Profile {
  final String id;
  final UserRole role;
  final String? firstName;
  final String? lastName;
  final String? profilePicture;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Profile({
    required this.id,
    this.role = UserRole.crew,
    this.firstName,
    this.lastName,
    this.profilePicture,
    this.createdAt,
    this.updatedAt,
  });

  factory Profile.fromMap(Map<String, dynamic> m) => Profile(
        id: m['id'] as String,
        role: userRoleFromString(m['role'] as String?),
        firstName: m['first_name'] as String?,
        lastName: m['last_name'] as String?,
        profilePicture: m['profile_picture'] as String?,
        createdAt: parseDateTime(m['created_at']),
        updatedAt: parseDateTime(m['updated_at']),
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'role': enumToString(role),
        'first_name': firstName,
        'last_name': lastName,
        'profile_picture': profilePicture,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
      }..removeWhere((k, v) => v == null);
}

