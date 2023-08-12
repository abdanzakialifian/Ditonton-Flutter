import 'package:ditonton/domain/repositories/tv_show_repository.dart';

class GetWatchlistStatusTvShow {
  final TvShowRepository _tvShowRepository;

  GetWatchlistStatusTvShow(this._tvShowRepository);

  Future<bool> execute(int id) {
    return _tvShowRepository.isAddedToWatchlistTvShow(id);
  }
}
