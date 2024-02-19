import 'package:samachar/model/NewsArticleModel.dart';

List<NewsArticleModel> filterConsecutiveRepeatedArticles(List<NewsArticleModel> articles) {
  if(articles.length <= 1){
    return [];
  }
  List<NewsArticleModel> filteredArticle = [articles[0]];

  for(int ind = 1;ind<articles.length;){
    int repInd = ind+1;
    while(repInd < articles.length && articles[repInd].title == articles[ind].title){
      repInd++;
    }
    if(repInd < articles.length){
      ind = repInd;
      filteredArticle.add(articles[repInd]);
    } else {
      break;
    }
  }
  return filteredArticle;
}