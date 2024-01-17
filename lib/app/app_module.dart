import 'package:water_jug_challenge/imports.dart';
import 'package:water_jug_challenge/modules/result/result_bloc.dart';
import 'package:water_jug_challenge/modules/result/result_usecase.dart';

class AppModule extends Bindings {
  @override
  void dependencies() {
    Get.put(ResultBloc());
    Get.put(ResultUseCase());
  }
}
