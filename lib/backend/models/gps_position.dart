import 'utils.dart';

class GpsPosition {
  final String id;
  final String regattaId;
  final String boatId;
  final double latitude;
  final double longitude;
  final double? speed;
  final double? heading;
  final DateTime timestamp;

  GpsPosition({
    required this.id,
    required this.regattaId,
    required this.boatId,
    required this.latitude,
    required this.longitude,
    this.speed,
    this.heading,
    required this.timestamp,
  });

  factory GpsPosition.fromMap(Map<String, dynamic> m) => GpsPosition(
        id: m['id'] as String,
        regattaId: m['regatta_id'] as String,
        boatId: m['boat_id'] as String,
        latitude: (m['latitude'] as num).toDouble(),
        longitude: (m['longitude'] as num).toDouble(),
        speed: (m['speed'] is num) ? (m['speed'] as num).toDouble() : null,
        heading: (m['heading'] is num) ? (m['heading'] as num).toDouble() : null,
        timestamp: parseDateTime(m['timestamp']) ?? DateTime.now(),
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'regatta_id': regattaId,
        'boat_id': boatId,
        'latitude': latitude,
        'longitude': longitude,
        'speed': speed,
        'heading': heading,
        'timestamp': timestamp.toIso8601String(),
      }..removeWhere((k, v) => v == null);
}

