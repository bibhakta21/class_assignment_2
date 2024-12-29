import 'package:meta/meta.dart';

@immutable
abstract class SimpleInterestEvent {}

class SimpleInterestBloc extends SimpleInterestEvent {
  final double p;
  final double r;
  final double t;

  SimpleInterestBloc({
    required this.p,
    required this.r,
    required this.t,
  });
}
