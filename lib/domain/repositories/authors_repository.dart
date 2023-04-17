import 'package:user_articles/data/remote_data_sources/authors_remote_data_source.dart';
import 'package:user_articles/domain/models/author_model.dart';

class AuthorsRepository {
  AuthorsRepository({required this.remoteDataSource});

  final AuthorsRemoteRetroFitDataSource remoteDataSource;

  Future<List<AuthorModel>> getAuthorModels() async {
    return remoteDataSource.getAuthors();
  }
}
