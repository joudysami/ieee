class Source {
  String? id;
  String? name;

  Source({this.id, this.name});

  factory Source.fromJson(Map<String, dynamic> json) =>
      Source(id: json['id'] as String?, name: json['name'] as String?);

  Map<String, dynamic> toJson() => {'id': id, 'name': name};
}

class Article {
  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  Article({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  factory Article.fromJson(Map<String, dynamic> json) => Article(
    source: json['source'] == null
        ? null
        : Source.fromJson(json['source'] as Map<String, dynamic>),
    author: json['author'] as String?,
    title: json['title'] as String?,
    description: json['description'] as String?,
    url: json['url'] as String?,
    urlToImage: json['urlToImage'] as String?,
    publishedAt: json['publishedAt'] as String?,
    content: json['content'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'source': source?.toJson(),
    'author': author,
    'title': title,
    'description': description,
    'url': url,
    'urlToImage': urlToImage,
    'publishedAt': publishedAt,
    'content': content,
  };
}
