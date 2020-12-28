class Content {
  String sort;
  String title;
  String body;
  List<int> tag;
  List<int> like;
  List<int> bookmark;
  int difficulty;
  String updatedAt;
  String summary;
  String image;
  Null audio;

  Content(
      {this.sort,
      this.title,
      this.body,
      this.tag,
      this.difficulty,
      this.like,
      this.bookmark,
      this.updatedAt,
      this.summary,
      this.image,
      this.audio});

  Content.fromJson(Map<String, dynamic> json) {
    sort = json['sort'];
    title = json['title'];
    body = json['body'];
    tag = json['tag'].cast<int>();
    like = json['like'].cast<int>();
    bookmark = json['bookmark'].cast<int>();
    difficulty = json['difficulty'];
    updatedAt = json['updated_at'];
    summary = json['summary'];
    image = json['image'];
    audio = json['audio'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['sort'] = sort;
    data['title'] = title;
    data['body'] = body;
    data['tag'] = tag;
    data['like'] = like;
    data['difficulty'] = difficulty;
    data['bookmark'] = bookmark;
    data['updated_at'] = updatedAt;
    data['summary'] = summary;
    data['image'] = image;
    data['audio'] = audio;
    return data;
  }
}
