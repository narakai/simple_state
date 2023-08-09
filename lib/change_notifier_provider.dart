import 'package:flutter/material.dart';
import 'package:simple_state/inherited_provider.dart';

class ChangeNotifierProvider<T extends ChangeNotifier> extends StatefulWidget {
  final Widget child;
  final T data;

  const ChangeNotifierProvider(
      {super.key, required this.data, required this.child});

  static T of<T>(BuildContext context) {
    final provider = context.dependOnInheritedWidgetOfExactType<
        InheritedProvider<T>>();
    return provider!.data;
  }

  @override
  _ChangeNotifierProviderState createState() {
    return _ChangeNotifierProviderState<T>();
  }

}

class _ChangeNotifierProviderState<T extends ChangeNotifier>
    extends State<ChangeNotifierProvider<T>> {

  void update() {
    setState(() => {});
  }

  @override
  Widget build(BuildContext context) {
    return InheritedProvider<T>(
      data: widget.data,
      child: widget.child,
    );
  }

  @override
  void initState() {
    widget.data.addListener(update);
    super.initState();
  }

  @override
  void dispose() {
    widget.data.removeListener(update);
    super.dispose();
  }


  @override
  void didUpdateWidget(ChangeNotifierProvider<T> oldWidget) {
    if (widget.data != oldWidget.data) {
      oldWidget.data.removeListener(update);
      widget.data.addListener(update);
    }
    super.didUpdateWidget(oldWidget);
  }

}