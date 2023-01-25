import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

enum AuthAspect { authState, user }

class AuthModel extends InheritedModel<AuthAspect> {
  const AuthModel({
    super.key,
    this.authState,
    this.user,
    required super.child,
  });

  final bool? authState;
  final User? user;

  static bool authStateOf(BuildContext context) {
    return InheritedModel.inheritFrom<AuthModel>(context,
                aspect: AuthAspect.authState)
            ?.authState ??
        false;
  }

  static User? userOf(BuildContext context) {
    return InheritedModel.inheritFrom<AuthModel>(context,
            aspect: AuthAspect.user)
        ?.user;
  }

  @override
  bool updateShouldNotify(AuthModel oldWidget) {
    return authState != oldWidget.authState || user != oldWidget.user;
  }

  @override
  bool updateShouldNotifyDependent(
    AuthModel oldWidget,
    Set<AuthAspect> dependencies,
  ) {
    if (authState != oldWidget.authState &&
        dependencies.contains(AuthAspect.authState)) {
      return true;
    }

    if (user != oldWidget.user && dependencies.contains(AuthAspect.user)) {
      return true;
    }
    return false;
  }
}

class AuthModelWidget extends StatefulWidget {
  const AuthModelWidget({super.key, required this.child});

  final Widget child;

  @override
  State<AuthModelWidget> createState() => _AuthModelWidgetState();
}

class _AuthModelWidgetState extends State<AuthModelWidget> {
  User? user;

  @override
  void didChangeDependencies() {
    FirebaseAuth.instance.authStateChanges().listen((event) {
      setState(() {
        print(event);
        user = event;
      });
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return AuthModel(
      user: user,
      child: widget.child,
    );
  }
}
