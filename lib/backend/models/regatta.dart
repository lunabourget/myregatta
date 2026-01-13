import 'enums.dart';
import 'utils.dart';

class Regatta {
  final String id;
  final String? organizerId;
  final String title;
  final String? description;
  final String? location;
  final DateTime? startDate;
  final DateTime? endDate;
  final int? maxParticipants;
  final String? instructionsPdfUrl;
  final RegattaStatus status;
  final DateTime? createdAt;

  Regatta({
    required this.id,
    this.organizerId,
    required this.title,
    this.description,
    this.location,
    this.startDate,
    this.endDate,
    this.maxParticipants,
    this.instructionsPdfUrl,
    this.status = RegattaStatus.draft,
    this.createdAt,
  });

  factory Regatta.fromMap(Map<String, dynamic> m) => Regatta(
        id: m['id'] as String,
        organizerId: m['organizer_id'] as String?,
        title: m['title'] as String,
        description: m['description'] as String?,
        location: m['location'] as String?,
        startDate: parseDateTime(m['start_date']),
        endDate: parseDateTime(m['end_date']),
        maxParticipants: m['max_participants'] as int?,
        instructionsPdfUrl: m['instructions_pdf_url'] as String?,
        status: regattaStatusFromString(m['status'] as String?),
        createdAt: parseDateTime(m['created_at']),
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'organizer_id': organizerId,
        'title': title,
        'description': description,
        'location': location,
        'start_date': startDate?.toIso8601String(),
        'end_date': endDate?.toIso8601String(),
        'max_participants': maxParticipants,
        'instructions_pdf_url': instructionsPdfUrl,
        'status': enumToString(status),
        'created_at': createdAt?.toIso8601String(),
      }..removeWhere((k, v) => v == null);
}

