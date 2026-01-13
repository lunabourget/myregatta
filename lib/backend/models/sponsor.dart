class Sponsor {
  final String id;
  final String name;
  final String? logoUrl;
  final String? link;
  final String? description;

  Sponsor({
    required this.id,
    required this.name,
    this.logoUrl,
    this.link,
    this.description,
  });

  factory Sponsor.fromMap(Map<String, dynamic> m) => Sponsor(
        id: m['id'] as String,
        name: m['name'] as String,
        logoUrl: m['logo_url'] as String?,
        link: m['link'] as String?,
        description: m['description'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'logo_url': logoUrl,
        'link': link,
        'description': description,
      }..removeWhere((k, v) => v == null);
}

