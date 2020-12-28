enum ContentType {
  game,
  setting,
  battleCry,
  music,
  recipe,
}

extension EnumToString on ContentType {
  String get string => toString().split('.')[1].replaceAll('_', ' ');
}
