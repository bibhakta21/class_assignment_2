import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../view/area_circle_view.dart';
import 'area_circle/area_of_circle_bloc.dart';
import 'simple_interest/simple_interest_bloc.dart';
import 'student/student_list_bloc.dart';
import '../view/simple_interest_view.dart';
import '../view/student_list_view.dart';


class DashboardBloc extends Cubit<void> {
  DashboardBloc(
      this._areaCircleBloc,
      this._simpleInterestBloc,
      this._studentBloc,
      ) : super(null);


  final AreaCircleBloc _areaCircleBloc;
  final SimpleInterestBloc _simpleInterestBloc;
  final StudentBloc _studentBloc;


  void openAreaCircleView(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => BlocProvider.value(
          value: _areaCircleBloc,
          child: AreaCircleView(),
        ),
      ),
    );
  }


  void openSimpleInterestView(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => BlocProvider.value(
          value: _simpleInterestBloc,
          child: SimpleInterestView(),
        ),
      ),
    );
  }


  void openStudentView(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => BlocProvider.value(
          value: _studentBloc,
          child: StudentView(),
        ),
      ),
    );
  }
}
