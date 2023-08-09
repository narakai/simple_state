import 'package:flutter/material.dart';
import 'package:simple_state/change_notifier_provider.dart';

class NotifyConsumer<T> extends StatelessWidget {
  final Widget Function(BuildContext context, T value) builder;

  const NotifyConsumer({super.key, required this.builder});

  @override
  Widget build(BuildContext context) {
    return builder(context, ChangeNotifierProvider.of<T>(context));
  }
}
