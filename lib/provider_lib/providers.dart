import 'package:flutter/material.dart';
import 'package:provider/provider.dart' as lib;
import 'package:provider/single_child_widget.dart';

class Provider<T> extends StatelessWidget {
  final T Function(BuildContext) create;
  final Widget child;

  const Provider({
    @required this.create,
    this.child,
  });

  static T notListener<T>(BuildContext context) {
    return lib.Provider.of<T>(context, listen: false);
  }

  @override
  SingleChildWidget build(BuildContext context) {
    return lib.Provider<T>(
      create: create,
      child: child,
    );
  }
}

class MultiProvider extends StatelessWidget {
  final List<Provider> providers;
  final Widget child;

  const MultiProvider({
    @required this.providers,
    @required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return lib.MultiProvider(
      providers: providers.map((provider) => provider.build(context)).toList(),
      child: child,
    );
  }
}
