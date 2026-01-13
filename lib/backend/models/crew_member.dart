import 'utils.dart';

class CrewMember {
  final String id;
  final String regattaId;
  final String userId;
  final String boatId;
  final String? role;
  final DateTime? createdAt;

  CrewMember({
    required this.id,
    required this.regattaId,
    required this.userId,
    required this.boatId,
    this.role,
    this.createdAt,
  });

  factory CrewMember.fromMap(Map<String, dynamic> m) => CrewMember(
        id: m['id'] as String,
        regattaId: m['regatta_id'] as String,
        userId: m['user_id'] as String,
        boatId: m['boat_id'] as String,
        role: m['role'] as String?,
        createdAt: parseDateTime(m['created_at']),
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'regatta_id': regattaId,
        'user_id': userId,
        'boat_id': boatId,
        'role': role,
        'created_at': createdAt?.toIso8601String(),
      }..removeWhere((k, v) => v == null);
}

