import 'utils.dart';

class Boat {
  final String id;
  final String? ownerId;
  final String? name;
  final String? type;
  final String? model;
  final String? pictureUrl;
  final double? length;
  final DateTime? createdAt;

  Boat({
    required this.id,
    this.ownerId,
    this.name,
    this.type,
    this.model,
    this.pictureUrl,
    this.length,
    this.createdAt,
  });

  factory Boat.fromMap(Map<String, dynamic> m) => Boat(
        id: m['id'] as String,
        ownerId: m['owner_id'] as String?,
        name: m['name'] as String?,
        type: m['type'] as String?,
        model: m['model'] as String?,
        pictureUrl: m['picture_url'] as String?,
        length: (m['length'] is num) ? (m['length'] as num).toDouble() : null,
        createdAt: parseDateTime(m['created_at']),
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'owner_id': ownerId,
        'name': name,
        'type': type,
        'model': model,
        'picture_url': pictureUrl,
        'length': length,
        'created_at': createdAt?.toIso8601String(),
      }..removeWhere((k, v) => v == null);
}

