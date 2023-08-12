import 'package:ditonton/domain/repositories/movie_repository.dart';

class GetWatchListStatusMovie {
  final MovieRepository _movieRepository;

  GetWatchListStatusMovie(this._movieRepository);

  Future<bool> execute(int id) async {
    return _movieRepository.isAddedToWatchlistMovie(id);
  }
}
