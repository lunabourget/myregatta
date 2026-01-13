import 'utils.dart';

class WeatherSnapshot {
  final String id;
  final String regattaId;
  final double? temperature;
  final double? windSpeed;
  final double? windDirection;
  final DateTime? timestamp;

  WeatherSnapshot({
    required this.id,
    required this.regattaId,
    this.temperature,
    this.windSpeed,
    this.windDirection,
    this.timestamp,
  });

  factory WeatherSnapshot.fromMap(Map<String, dynamic> m) => WeatherSnapshot(
        id: m['id'] as String,
        regattaId: m['regatta_id'] as String,
        temperature: (m['temperature'] is num) ? (m['temperature'] as num).toDouble() : null,
        windSpeed: (m['wind_speed'] is num) ? (m['wind_speed'] as num).toDouble() : null,
        windDirection: (m['wind_direction'] is num) ? (m['wind_direction'] as num).toDouble() : null,
        timestamp: parseDateTime(m['timestamp']),
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'regatta_id': regattaId,
        'temperature': temperature,
        'wind_speed': windSpeed,
        'wind_direction': windDirection,
        'timestamp': timestamp?.toIso8601String(),
      }..removeWhere((k, v) => v == null);
}

