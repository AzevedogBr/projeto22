part of 'splash_cubit.dart';

enum SplashStatus { initial, done }

class SplashState {
  final SplashStatus status;

  const SplashState({this.status = SplashStatus.initial});

  SplashState copyWith({SplashStatus? status}) {
    return SplashState(status: status ?? this.status);
  }
}
