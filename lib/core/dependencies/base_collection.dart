import 'package:get_it/get_it.dart';

abstract class BaseCollection {
  final GetIt collection = GetIt.asNewInstance();

  T get<T extends Object>();
  void setup();
}
