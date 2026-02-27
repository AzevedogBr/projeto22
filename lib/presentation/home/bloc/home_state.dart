part of 'home_cubit.dart';

enum CheckStatus { initial, perfect, notPerfect }

enum RangeStatus { initial, loading, done, error }

class HomeState {
  final CheckStatus checkStatus;
  final RangeStatus rangeStatus;
  final int? checkedNumber;
  final List<int> perfectsInRange;

  const HomeState({
    this.checkStatus = CheckStatus.initial,
    this.rangeStatus = RangeStatus.initial,
    this.checkedNumber,
    this.perfectsInRange = const [],
  });

  HomeState copyWith({
    CheckStatus? checkStatus,
    RangeStatus? rangeStatus,
    int? checkedNumber,
    List<int>? perfectsInRange,
  }) {
    return HomeState(
      checkStatus: checkStatus ?? this.checkStatus,
      rangeStatus: rangeStatus ?? this.rangeStatus,
      checkedNumber: checkedNumber ?? this.checkedNumber,
      perfectsInRange: perfectsInRange ?? this.perfectsInRange,
    );
  }
}
