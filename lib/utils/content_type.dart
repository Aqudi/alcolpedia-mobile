enum ContentType {
  game,
  setting,
  cheers,
  bgm,
  alcohol,
  // ignore: constant_identifier_names
  hot_contents,
}

extension EnumToString on ContentType {
  String get string => toString().split('.')[1].replaceAll('_', ' ');
}
