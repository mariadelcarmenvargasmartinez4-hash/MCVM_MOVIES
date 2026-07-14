import 'package:flutter_test/flutter_test.dart';
import 'package:mcvm_movie/Presentation/providers/movies/movies_providers.dart';

void main() {
  test('loadNextPage should not stay loading when the request fails', () async {
    final notifier = MoviesNotifier(
      fetchMoreMovies: ({int page = 1}) async {
        throw Exception('network error');
      },
    );

    await expectLater(notifier.loadNextPage(), completes);
    expect(notifier.state, isEmpty);
    expect(notifier.isLoading, isFalse);
  });
}
