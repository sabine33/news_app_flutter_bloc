import 'dart:convert';

import 'package:flutter/foundation.dart';

class NewsModel {
  String title;
  String pubDate;
  String link;
  String author;
  String guid;
  String thumbnail;
  String description;
  String content;
  Map enclosure;
  List categories;
  NewsModel({
    required this.title,
    required this.pubDate,
    required this.link,
    required this.author,
    required this.guid,
    required this.thumbnail,
    required this.description,
    required this.content,
    required this.enclosure,
    required this.categories,
  });

  NewsModel copyWith({
    String? title,
    String? pubDate,
    String? link,
    String? author,
    String? guid,
    String? thumbnail,
    String? description,
    String? content,
    Map? enclosure,
    List? categories,
  }) {
    return NewsModel(
      title: title ?? this.title,
      pubDate: pubDate ?? this.pubDate,
      link: link ?? this.link,
      author: author ?? this.author,
      guid: guid ?? this.guid,
      thumbnail: thumbnail ?? this.thumbnail,
      description: description ?? this.description,
      content: content ?? this.content,
      enclosure: enclosure ?? this.enclosure,
      categories: categories ?? this.categories,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'pubDate': pubDate,
      'link': link,
      'author': author,
      'guid': guid,
      'thumbnail': thumbnail,
      'description': description,
      'content': content,
      'enclosure': enclosure,
      'categories': categories,
    };
  }

  factory NewsModel.fromMap(Map<String, dynamic> map) {
    return NewsModel(
      title: map['title'] ?? '',
      pubDate: map['pubDate'] ?? '',
      link: map['link'] ?? '',
      author: map['author'] ?? '',
      guid: map['guid'] ?? '',
      thumbnail: map['thumbnail'] ?? '',
      description: map['description'] ?? '',
      content: map['content'] ?? '',
      enclosure: Map.from(map['enclosure']),
      categories: List.from(map['categories']),
    );
  }

  String toJson() => json.encode(toMap());

  factory NewsModel.fromJson(String source) =>
      NewsModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'NewsModel(title: $title, pubDate: $pubDate, link: $link, author: $author, guid: $guid, thumbnail: $thumbnail, description: $description, content: $content, enclosure: $enclosure, categories: $categories)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is NewsModel &&
        other.title == title &&
        other.pubDate == pubDate &&
        other.link == link &&
        other.author == author &&
        other.guid == guid &&
        other.thumbnail == thumbnail &&
        other.description == description &&
        other.content == content &&
        mapEquals(other.enclosure, enclosure) &&
        listEquals(other.categories, categories);
  }

  @override
  int get hashCode {
    return title.hashCode ^
        pubDate.hashCode ^
        link.hashCode ^
        author.hashCode ^
        guid.hashCode ^
        thumbnail.hashCode ^
        description.hashCode ^
        content.hashCode ^
        enclosure.hashCode ^
        categories.hashCode;
  }
}
