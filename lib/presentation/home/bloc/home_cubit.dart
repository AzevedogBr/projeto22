import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projeto22/domain/services/perfect_number_service.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState());

  final _service = PerfectNumberService();

  void checkNumber(int n) {
    final result = _service.isPerfect(n);
    emit(
      state.copyWith(
        checkStatus: result ? CheckStatus.perfect : CheckStatus.notPerfect,
        checkedNumber: n,
      ),
    );
  }

  Future<void> findInRange(int start, int end) async {
    emit(state.copyWith(rangeStatus: RangeStatus.loading));
    await Future.delayed(const Duration(milliseconds: 200));
    final results = _service.findInRange(start, end);
    emit(
      state.copyWith(rangeStatus: RangeStatus.done, perfectsInRange: results),
    );
  }

  void resetCheck() => emit(state.copyWith(checkStatus: CheckStatus.initial));

  void resetRange() => emit(
    state.copyWith(rangeStatus: RangeStatus.initial, perfectsInRange: []),
  );
}
