class RegattaSponsor {
  final String regattaId;
  final String sponsorId;

  RegattaSponsor({required this.regattaId, required this.sponsorId});

  factory RegattaSponsor.fromMap(Map<String, dynamic> m) => RegattaSponsor(
        regattaId: m['regatta_id'] as String,
        sponsorId: m['sponsor_id'] as String,
      );

  Map<String, dynamic> toMap() => {
        'regatta_id': regattaId,
        'sponsor_id': sponsorId,
      };
}

