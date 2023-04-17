import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:user_articles/domain/models/author_model.dart';

part 'authors_remote_data_source.g.dart';

@injectable
@RestApi()
abstract class AuthorsRemoteRetroFitDataSource {
  @factoryMethod
  factory AuthorsRemoteRetroFitDataSource(Dio dio) =
      _AuthorsRemoteRetroFitDataSource;

  @GET("/users")
  Future<List<AuthorModel>> getAuthors();
}
