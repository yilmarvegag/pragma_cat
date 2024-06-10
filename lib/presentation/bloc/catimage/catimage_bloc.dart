import 'package:bloc/bloc.dart';
import 'package:pragma_cat/domain/repositories/i_cat_repository.dart';

part 'catimage_event.dart';
part 'catimage_state.dart';

class CatImageBloc extends Bloc<CatImageEvent, CatImageState> {
  final ICatRepository catRepository;

  CatImageBloc(this.catRepository) : super(CatImageInitial()) {
    on<LoadCatImage>(_onFetchCatImage);
  }

  void _onFetchCatImage(LoadCatImage event, Emitter<CatImageState> emit) async {
    emit(CatImageLoading());
    try {
      final imageUrl =
          await catRepository.fetchBreedImage(event.referenceImageId);
      emit(CatImageLoaded(imageUrl));
    } catch (e) {
      emit(CatImageError(e.toString()));
    }
  }
}
