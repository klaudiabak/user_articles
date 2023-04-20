import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/scaffolding.dart';
import 'package:user_articles/app/core/enums.dart';
import 'package:user_articles/domain/models/article_model.dart';
import 'package:user_articles/domain/repositories/articles_repository.dart';
import 'package:user_articles/features/articles/cubit/articles_cubit.dart';

class MockArticlesRepository extends Mock implements ArticlesRepository {}

void main() {
  late ArticlesCubit sut;
  late MockArticlesRepository repository;

  setUp(() {
    repository = MockArticlesRepository();
    sut = ArticlesCubit(articlesRepository: repository);
  });

  group('fetchData', () {
    group('success', () {
      setUp(() {
        when(() => repository.getArticlesForAuthorId(555)).thenAnswer(
          (_) async => [
            ArticleModel(1, 555, 'content1', 'picture1'),
            ArticleModel(2, 555, 'content2', 'picture2'),
            ArticleModel(3, 555, 'content3', 'picture3'),
          ],
        );
      });

      blocTest<ArticlesCubit, ArticlesState>(
        'emits Status.loading then Status.success with results',
        build: () => sut,
        act: (cubit) => cubit.fetchData(authorId: 555),
        expect: () => [
          ArticlesState(
            status: Status.loading,
          ),
          ArticlesState(
            status: Status.success,
            results: [
              ArticleModel(1, 555, 'content1', 'picture1'),
              ArticleModel(2, 555, 'content2', 'picture2'),
              ArticleModel(3, 555, 'content3', 'picture3'),
            ],
          ),
        ],
      );
    });

    group('failure', () {
      setUp(() {
        when(() => repository.getArticlesForAuthorId(555)).thenThrow(
          Exception('test-exception-error'),
        );
      });

      blocTest<ArticlesCubit, ArticlesState>(
        'emits Status.loading then Status.error with error message',
        build: () => sut,
        act: (cubit) => cubit.fetchData(authorId: 555),
        expect: () => [
          ArticlesState(
            status: Status.loading,
          ),
          ArticlesState(
              status: Status.error,
              errorMessage: 'Exception: test-exception-error'),
        ],
      );
    });
  });
}
