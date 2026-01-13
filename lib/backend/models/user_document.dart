import 'enums.dart';
import 'utils.dart';

class UserDocument {
  final String id;
  final String? userId;
  final DocType type;
  final String fileUrl;
  final DateTime? uploadedAt;

  UserDocument({
    required this.id,
    this.userId,
    required this.type,
    required this.fileUrl,
    this.uploadedAt,
  });

  factory UserDocument.fromMap(Map<String, dynamic> m) => UserDocument(
        id: m['id'] as String,
        userId: m['user_id'] as String?,
        type: docTypeFromString(m['type'] as String?),
        fileUrl: m['file_url'] as String,
        uploadedAt: parseDateTime(m['uploaded_at']),
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'user_id': userId,
        'type': enumToString(type),
        'file_url': fileUrl,
        'uploaded_at': uploadedAt?.toIso8601String(),
      }..removeWhere((k, v) => v == null);
}

