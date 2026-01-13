import 'enums.dart';
import 'utils.dart';

class MediaItem {
  final String id;
  final String regattaId;
  final String? userId;
  final MediaType? type;
  final String url;
  final String? caption;
  final DateTime? createdAt;

  MediaItem({
    required this.id,
    required this.regattaId,
    this.userId,
    this.type,
    required this.url,
    this.caption,
    this.createdAt,
  });

  factory MediaItem.fromMap(Map<String, dynamic> m) => MediaItem(
        id: m['id'] as String,
        regattaId: m['regatta_id'] as String,
        userId: m['user_id'] as String?,
        type: m['type'] != null ? mediaTypeFromString(m['type'] as String?) : null,
        url: m['url'] as String,
        caption: m['caption'] as String?,
        createdAt: parseDateTime(m['created_at']),
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'regatta_id': regattaId,
        'user_id': userId,
        'type': type != null ? enumToString(type!) : null,
        'url': url,
        'caption': caption,
        'created_at': createdAt?.toIso8601String(),
      }..removeWhere((k, v) => v == null);
}

