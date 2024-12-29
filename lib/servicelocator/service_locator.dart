import 'package:class_assignment_2/bloc/area_circle/area_of_circle_bloc.dart';
import 'package:class_assignment_2/bloc/dashboard_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:class_assignment_2/bloc/simple_interest/simple_interest_bloc.dart';
import 'package:class_assignment_2/bloc/student/student_list_bloc.dart';



// Service locator instance for managing dependencies
final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  _initBloc();
}

void _initBloc() {
  // Register BLoCs as lazy singletons so they are created only when needed
  serviceLocator.registerLazySingleton(() => AreaCircleBloc());
  serviceLocator.registerLazySingleton(() => SimpleInterestBloc());
  serviceLocator.registerLazySingleton(() => StudentBloc());

 // Register DashboardBloc as a factory with dependencies injected from serviceLocator
  serviceLocator.registerFactory(() => DashboardBloc(
    serviceLocator<AreaCircleBloc>(),
    serviceLocator<SimpleInterestBloc>(),
    serviceLocator<StudentBloc>(),
  ));
}
