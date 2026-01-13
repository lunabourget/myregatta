import 'utils.dart';

class Registration {
  final String id;
  final String regattaId;
  final String? boatId;
  final String? skipperId;
  final String status;
  final DateTime? submittedAt;
  final DateTime? validatedAt;

  Registration({
    required this.id,
    required this.regattaId,
    this.boatId,
    this.skipperId,
    this.status = 'pending',
    this.submittedAt,
    this.validatedAt,
  });

  factory Registration.fromMap(Map<String, dynamic> m) => Registration(
        id: m['id'] as String,
        regattaId: m['regatta_id'] as String,
        boatId: m['boat_id'] as String?,
        skipperId: m['skipper_id'] as String?,
        status: m['status'] as String? ?? 'pending',
        submittedAt: parseDateTime(m['submitted_at']),
        validatedAt: parseDateTime(m['validated_at']),
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'regatta_id': regattaId,
        'boat_id': boatId,
        'skipper_id': skipperId,
        'status': status,
        'submitted_at': submittedAt?.toIso8601String(),
        'validated_at': validatedAt?.toIso8601String(),
      }..removeWhere((k, v) => v == null);
}

