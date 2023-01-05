import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:gif_repository/gif_repository.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.gifRepository) : super(HomeState());

  final GifRepository gifRepository;

  Future<void> getGifs() async {
    try{
      final gifUrls = await gifRepository.getGifs();
      emit(state.copyWith(status: HomeStatus.success, gifs: gifUrls));
    }on Exception {
      emit(state.copyWith(status: HomeStatus.failure));
    }
  }
}
