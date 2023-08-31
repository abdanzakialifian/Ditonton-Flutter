import 'package:domain/entities/category.dart';
import 'package:domain/usecases/search_movies.dart';
import 'package:domain/usecases/search_tv_shows.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchMovies _searchMovies;
  final SearchTvShows _searchTvShows;

  SearchBloc(this._searchMovies, this._searchTvShows) : super(SearchEmpty()) {
    on<OnQueryChangedFetchMovies>(
      (event, emit) async {
        final query = event.query;

        emit(SearchLoading());

        final result = await _searchMovies.execute(query);

        result.fold(
          (failure) {
            emit(SearchError(failure.message));
          },
          (data) {
            emit(SearchData(data));
          },
        );
      },
      transformer: debounce(
        const Duration(milliseconds: 500),
      ),
    );

    on<OnQueryChangedFetchTvShows>(
      (event, emit) async {
        final query = event.query;

        emit(SearchLoading());

        final result = await _searchTvShows.execute(query);

        result.fold(
          (failure) {
            emit(SearchError(failure.message));
          },
          (data) {
            emit(SearchData(data));
          },
        );
      },
      transformer: debounce(
        const Duration(milliseconds: 500),
      ),
    );

    on<ClearResultList>((event, emit) {
      emit(SearchEmpty());
    });
  }

  EventTransformer<T> debounce<T>(Duration duration) {
    return (events, mapper) => events.debounceTime(duration).flatMap(mapper);
  }
}
