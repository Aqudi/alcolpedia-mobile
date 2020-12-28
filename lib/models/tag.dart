class Tag {
  String title;

  Tag({this.title});

  Tag.fromJson(Map<String, dynamic> json) {
    title = json['fields']['title'];
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'fields': {'title': title}
    };
  }
}
