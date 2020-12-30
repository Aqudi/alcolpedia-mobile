class Tag {
  String title;

  Tag({this.title});

  Tag.fromJson(Map<String, dynamic> json) {
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'fields': {'title': title}
    };
  }
}
