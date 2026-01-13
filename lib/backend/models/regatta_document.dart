class RegattaDocument {
  final String id;
  final String regattaId;
  final String? name;
  final String? type;
  final String? fileUrl;

  RegattaDocument({
    required this.id,
    required this.regattaId,
    this.name,
    this.type,
    this.fileUrl,
  });

  factory RegattaDocument.fromMap(Map<String, dynamic> m) => RegattaDocument(
        id: m['id'] as String,
        regattaId: m['regatta_id'] as String,
        name: m['name'] as String?,
        type: m['type'] as String?,
        fileUrl: m['file_url'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'regatta_id': regattaId,
        'name': name,
        'type': type,
        'file_url': fileUrl,
      }..removeWhere((k, v) => v == null);
}

