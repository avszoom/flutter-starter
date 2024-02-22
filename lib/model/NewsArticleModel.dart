class NewsArticleModel {
  final String source;
  final String author;
  final String title;
  final String shortDesc;
  final String articleUrl;
  final String mediaUrl;
  final String content;
  final String publishTime;

  NewsArticleModel({required this.source, required this.author, required this.title, required this.shortDesc, required this.articleUrl, required this.mediaUrl, required this.content, required this.publishTime});

  factory NewsArticleModel.fromJson(Map<String, dynamic> json) {
    return NewsArticleModel(
      source:json['source'], 
      author:json['author'] ?? "", 
      title:json['title'], 
      shortDesc:json['short_desc'] ?? "", 
      articleUrl:json['article_url'], 
      mediaUrl:json['media_url'] ?? "", 
      content:json['content'], 
      publishTime:json['publish_time']);
  }
}