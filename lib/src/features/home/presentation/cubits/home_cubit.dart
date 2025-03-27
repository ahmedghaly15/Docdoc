import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:docdoc/src/features/home/data/repos/home_repo.dart';
import 'package:docdoc/src/features/home/presentation/cubits/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;

  HomeCubit(this._homeRepo) : super(const HomeState.initial());

  void getAllSpecialization() async {
    emit(const HomeState.getAllSpecializationLoading());
    final response = await _homeRepo.getAllSpecialization();
    response.when(
      success: (data) => emit(HomeState.getAllSpecializationSuccess(data)),
      failure: (error) => emit(
        HomeState.getAllSpecializationError(error.message ?? ''),
      ),
    );
  }
}
