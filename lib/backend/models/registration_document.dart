class RegistrationDocument {
  final String id;
  final String registrationId;
  final String? documentType;
  final String? fileUrl;

  RegistrationDocument({
    required this.id,
    required this.registrationId,
    this.documentType,
    this.fileUrl,
  });

  factory RegistrationDocument.fromMap(Map<String, dynamic> m) => RegistrationDocument(
        id: m['id'] as String,
        registrationId: m['registration_id'] as String,
        documentType: m['document_type'] as String?,
        fileUrl: m['file_url'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'registration_id': registrationId,
        'document_type': documentType,
        'file_url': fileUrl,
      }..removeWhere((k, v) => v == null);
}

