import 'package:equatable/equatable.dart';

abstract class TvEvents extends Equatable {}

class OnEventOnTheAirTv extends TvEvents {
  @override
  List<Object> get props => [];
}

class OnEventGetHomeScreen extends TvEvents {
  final int indexOfHomeScreen;

  OnEventGetHomeScreen(this.indexOfHomeScreen);

  @override
  List<Object> get props => [indexOfHomeScreen];
}

class OnEventPopularTv extends TvEvents {
  @override
  List<Object> get props => [];
}

class OnEventTopRatedTv extends TvEvents {
  @override
  List<Object> get props => [];
}
