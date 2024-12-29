import 'package:bloc/bloc.dart';

class SimpleInterestBloc extends Cubit<double> {
  SimpleInterestBloc() : super(0.0);

  void calculateInterest(double p, double r, double t) {
    final interest = (p * r * t) / 100;
    emit(interest);
  }
}
