
import 'package:flutter_douban/entity/movie.dart';

class MovieInfo{
  final RatingBean rating;
  final int reviewsCount;
  final int wishCount;
  final String doubanSite;
  final String year;
  final ImagesBean images;
  final String alt;
  final String id;
  final String mobileUrl;
  final String title;
  final Object doCount;
  final String shareUrl;
  final Object seasonsCount;
  final String scheduleUrl;
  final Object episodesCount;
  final int collectCount;
  final Object currentSeason;
  final String originalTitle;
  final String summary;
  final String subtype;
  final int commentsCount;
  final int ratingsCount;
  final List<String> countries;
  final List<String> genres;
  final List<CastsBean> casts;
  final List<DirectorsBean> directors;
  final List<String> aka;
  MovieInfo(this.rating, this.reviewsCount, this.wishCount, this.doubanSite, this.year, this.images, this.alt, this.id, this.mobileUrl, this.title, this.doCount, this.shareUrl, this.seasonsCount, this.scheduleUrl, this.episodesCount, this.collectCount, this.currentSeason, this.originalTitle, this.summary, this.subtype, this.commentsCount, this.ratingsCount, this.countries, this.genres, this.casts, this.directors, this.aka);
  factory MovieInfo.forJson(Map<String,dynamic> json){
    List<String> genres= List<String>.generate(json['genres'].length, (index){
      return json['genres'][index];
    });
    List<String> countries= List<String>.generate(json['countries'].length, (index){
      return json['countries'][index];
    });
    List<String> aka= List<String>.generate(json['aka'].length, (index){
      return json['aka'][index];
    });
    List<CastsBean> casts= List<CastsBean>.generate(json['casts'].length, (index){
      var obj=json['casts'][index];
      return new CastsBean(obj['alt'], obj['avatars']==null?null: AvatarsBean(obj['avatars']['small'], obj['avatars']['large'], obj['avatars']['medium']), obj['name'], obj['id']);
    });

    List<DirectorsBean> directors=new List<DirectorsBean>.generate(json['directors'].length, (index){
      var obj=json['directors'][index];
      return  DirectorsBean(obj['alt'], obj['avatars']==null?null: AvatarsBean(obj['avatars']['small'], obj['avatars']['large'], obj['avatars']['medium']), obj['name'], obj['id']);
    });
    return  MovieInfo( RatingBean(double.parse('${json['rating']['max']}') , double.parse('${json['rating']['average']}') , json['rating']['stars'] , double.parse('${json['rating']['min']}') )
        , json['reviews_count'], json['wish_count'], json['douban_site'], json['year']
        ,  ImagesBean(json['images']['small'], json['images']['large'], json['images']['medium'])
        , json['alt'], json['id'], json['mobile_url'], json['title'], json['do_count'], json['share_url'], json['seasons_count'], json['schedule_url'], json['episodes_count'], json['collect_count'], json['current_season'], json['original_title']
        , json['summary'], json['subtype']
        , json['comments_count'], json['ratings_count'], countries, genres, casts, directors,aka);
  }
}
