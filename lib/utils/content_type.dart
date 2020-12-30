enum ContentType {
  game,
  setting,
  cheers,
  bgm,
  alcohol,
}

extension EnumToString on ContentType {
  String get string => toString().split('.')[1].replaceAll('_', ' ');
}
