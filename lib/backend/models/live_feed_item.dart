import 'utils.dart';

class LiveFeedItem {
  final String id;
  final String regattaId;
  final String? userId;
  final String? message;
  final DateTime? createdAt;

  LiveFeedItem({
    required this.id,
    required this.regattaId,
    this.userId,
    this.message,
    this.createdAt,
  });

  factory LiveFeedItem.fromMap(Map<String, dynamic> m) => LiveFeedItem(
        id: m['id'] as String,
        regattaId: m['regatta_id'] as String,
        userId: m['user_id'] as String?,
        message: m['message'] as String?,
        createdAt: parseDateTime(m['created_at']),
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'regatta_id': regattaId,
        'user_id': userId,
        'message': message,
        'created_at': createdAt?.toIso8601String(),
      }..removeWhere((k, v) => v == null);
}

