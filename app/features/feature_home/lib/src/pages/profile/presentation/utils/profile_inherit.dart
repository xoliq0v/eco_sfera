import 'package:flutter/material.dart';

class ProfilePageInherit extends InheritedWidget {
  const ProfilePageInherit({
    required super.child,
    this.scrollListener,
    super.key,
  });

  final ValueNotifier<double>? scrollListener;

  static ProfilePageInherit of(BuildContext context) {
    final result =
    context.dependOnInheritedWidgetOfExactType<ProfilePageInherit>();
    assert(result != null, 'No HomePageInherit found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(ProfilePageInherit oldWidget) {
    return false;
  }
}
