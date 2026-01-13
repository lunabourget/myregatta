enum UserRole { skipper, crew, organizer, admin }
enum DocType { licence, assurance, certificat, autre }
enum RegattaStatus { draft, open, closed, finished }
enum MediaType { photo, video }

String enumToString(Object e) => e.toString().split('.').last;

UserRole userRoleFromString(String? v) {
  switch (v) {
    case 'skipper':
      return UserRole.skipper;
    case 'organizer':
      return UserRole.organizer;
    case 'admin':
      return UserRole.admin;
    case 'crew':
    default:
      return UserRole.crew;
  }
}

DocType docTypeFromString(String? v) {
  switch (v) {
    case 'licence':
      return DocType.licence;
    case 'assurance':
      return DocType.assurance;
    case 'certificat':
      return DocType.certificat;
    default:
      return DocType.autre;
  }
}

RegattaStatus regattaStatusFromString(String? v) {
  switch (v) {
    case 'open':
      return RegattaStatus.open;
    case 'closed':
      return RegattaStatus.closed;
    case 'finished':
      return RegattaStatus.finished;
    case 'draft':
    default:
      return RegattaStatus.draft;
  }
}

MediaType mediaTypeFromString(String? v) {
  switch (v) {
    case 'video':
      return MediaType.video;
    case 'photo':
    default:
      return MediaType.photo;
  }
}

