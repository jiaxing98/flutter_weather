import 'package:flutter/material.dart';
import 'package:flutter_weather/core/utils/api_change_notifier.dart';
import 'package:flutter_weather/core/utils/api_exception.dart';
import 'package:provider/provider.dart';

class ApiConsumer<T extends ApiChangeNotifier> extends StatelessWidget {
  final Widget Function(BuildContext, T, Widget?) onInit;
  final Widget Function(BuildContext, T, Widget?) onLoading;
  final Widget Function(BuildContext, T, ApiException, Widget?) onError;
  final Widget Function(BuildContext, T, Widget?) onCompleted;
  final Widget? Function()? child;

  const ApiConsumer({
    super.key,
    required this.onInit,
    required this.onLoading,
    required this.onError,
    required this.onCompleted,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    final notifier = Provider.of<T>(context);

    switch (notifier.state) {
      case ApiState.init:
        return Consumer<T>(
          builder: (context, value, child) => onInit(context, value, child),
          child: child?.call(),
        );
      case ApiState.loading:
        return Consumer<T>(
          builder: (context, value, child) => onLoading(context, value, child),
          child: child?.call(),
        );
      case ApiState.exception:
        return Consumer<T>(
          builder: (context, value, child) => onError(context, value,
              notifier.exception ?? UnknownApiException(), child),
          child: child?.call(),
        );
      case ApiState.completed:
        return Consumer<T>(
          builder: (context, value, child) =>
              onCompleted(context, value, child),
          child: child?.call(),
        );
    }
  }
}
