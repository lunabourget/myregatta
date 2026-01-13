import 'utils.dart';

class RaceResult {
  final String id;
  final String regattaId;
  final String boatId;
  final int? position;
  final String? timeElapsed;
  final double? points;
  final DateTime? createdAt;

  RaceResult({
    required this.id,
    required this.regattaId,
    required this.boatId,
    this.position,
    this.timeElapsed,
    this.points,
    this.createdAt,
  });

  factory RaceResult.fromMap(Map<String, dynamic> m) => RaceResult(
        id: m['id'] as String,
        regattaId: m['regatta_id'] as String,
        boatId: m['boat_id'] as String,
        position: m['position'] as int?,
        timeElapsed: m['time_elapsed'] as String?,
        points: (m['points'] is num) ? (m['points'] as num).toDouble() : null,
        createdAt: parseDateTime(m['created_at']),
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'regatta_id': regattaId,
        'boat_id': boatId,
        'position': position,
        'time_elapsed': timeElapsed,
        'points': points,
        'created_at': createdAt?.toIso8601String(),
      }..removeWhere((k, v) => v == null);
}

