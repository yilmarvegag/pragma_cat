import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pragma_cat/domain/entities/cats/breed_entity.dart';
import 'package:pragma_cat/domain/repositories/i_cat_repository.dart';

part 'catlist_event.dart';
part 'catlist_state.dart';

class CatListBloc extends Bloc<CatListEvent, CatListState> {
  final ICatRepository catRepository;

  CatListBloc(this.catRepository) : super(CatListInitial()) {
    on<LoadCatList>(_onFetchCatList);
    on<NavigateToDetail>(_onDetailBreed);
    on<NavigateBack>(_backScreen);
  }

  void _onFetchCatList(LoadCatList event, Emitter<CatListState> emit) async {
    emit(CatListLoading());
    try {
      final breeds = await catRepository.getAllBreeds();
      emit(CatListLoaded(cats: breeds));
    } catch (e) {
      emit(CatListError(error: e.toString()));
    }
  }

  _onDetailBreed(NavigateToDetail event, Emitter<CatListState> emit) {
    emit(CatListLoading());
    try {
      emit(CatListNavigating(breed: event.breed, imgUrl: event.imgUrl));
    } catch (e) {
      emit(CatListError(error: e.toString()));
    }
  }

  _backScreen(NavigateBack event, Emitter<CatListState> emit) async {
    emit(CatListLoading());
    try {
      final breeds = await catRepository.getAllBreeds();
      emit(CatListLoaded(cats: breeds));
    } catch (e) {
      emit(CatListError(error: e.toString()));
    }
  }
}
