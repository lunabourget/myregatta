import 'utils.dart';

class PostComment {
  final String id;
  final String postId;
  final String? userId;
  final String? comment;
  final DateTime? createdAt;

  PostComment({
    required this.id,
    required this.postId,
    this.userId,
    this.comment,
    this.createdAt,
  });

  factory PostComment.fromMap(Map<String, dynamic> m) => PostComment(
        id: m['id'] as String,
        postId: m['post_id'] as String,
        userId: m['user_id'] as String?,
        comment: m['comment'] as String?,
        createdAt: parseDateTime(m['created_at']),
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'post_id': postId,
        'user_id': userId,
        'comment': comment,
        'created_at': createdAt?.toIso8601String(),
      }..removeWhere((k, v) => v == null);
}

