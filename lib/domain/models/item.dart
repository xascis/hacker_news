class Item {
  final int id;
  final bool deleted;
  final String type;
  final String by;
  final int time;
  final String text;
  final bool dead;
  final int parent;
  final int poll;
  final List<int> kids;
  final String url;
  final int score;
  final String title;
  final List<int> parts;
  final int descendants;

  Item(this.id, this.deleted, this.type, this.by, this.time, this.text, this.dead, this.parent, this.poll, this.kids, this.url, this.score, this.title, this.parts, this.descendants);

  factory Item.fromJson(Map json) {
    return Item(
      json['id'],
      json['deleted'] ?? false,
      json['type'],
      json['by'],
      json['time'],
      json['text'],
      json['dead'] ?? false,
      json['parent'],
      json['poll'],
      List.castFrom(json['kids'] ?? []),
      json['url'],
      json['score'],
      json['title'],
      List.castFrom(json['parts']),
      json['descendants'],
    );
  }

  factory Item.fromMap(Map map) {
    return Item(
      map['id'],
      map['deleted'] ?? false,
      map['type'],
      map['by'],
      map['time'],
      map['text'],
      map['dead'] ?? false,
      map['parent'],
      map['poll'],
      List.castFrom(map['kids'] ?? []),
      map['url'],
      map['score'],
      map['title'],
      List.castFrom(map['parts']),
      map['descendants'],
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "id": this.id
    };
  }
  
}