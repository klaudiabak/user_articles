import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';
import 'package:test/scaffolding.dart';
import 'package:user_articles/data/remote_data_sources/articles_remote_data_source.dart';
import 'package:user_articles/domain/repositories/articles_repository.dart';

class MockArticlesDataSource extends Mock
    implements ArticlesRemoteRetrofitDataSource {}

void main() {
  ArticlesRepository sut;
  MockArticlesDataSource dataSource;

  setUp(() {
    dataSource = MockArticlesDataSource();
    sut = ArticlesRepository(remoteDataSource: dataSource);
  });
}
