import 'package:ditonton/domain/repositories/movie_repository.dart';

class GetWatchListStatus {
  final MovieRepository _movieRepository;

  GetWatchListStatus(this._movieRepository);

  Future<bool> execute(int id) async {
    return _movieRepository.isAddedToWatchlist(id);
  }
}
