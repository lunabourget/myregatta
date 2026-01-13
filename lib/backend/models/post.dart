import 'utils.dart';

class Post {
  final String id;
  final String? userId;
  final String? regattaId;
  final String? content;
  final DateTime? createdAt;

  Post({
    required this.id,
    this.userId,
    this.regattaId,
    this.content,
    this.createdAt,
  });

  factory Post.fromMap(Map<String, dynamic> m) => Post(
        id: m['id'] as String,
        userId: m['user_id'] as String?,
        regattaId: m['regatta_id'] as String?,
        content: m['content'] as String?,
        createdAt: parseDateTime(m['created_at']),
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'user_id': userId,
        'regatta_id': regattaId,
        'content': content,
        'created_at': createdAt?.toIso8601String(),
      }..removeWhere((k, v) => v == null);
}

