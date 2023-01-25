import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/foundation.dart';

//FRONT
@immutable
class AuthScope extends StatefulWidget {
  final Widget child;

  const AuthScope({super.key, required this.child});

  static AuthScopeState? of(BuildContext context) => _AuthScopeIW.of(context);

  @override
  State<AuthScope> createState() => AuthScopeState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) =>
      super.debugFillProperties(
        properties
          ..add(
            StringProperty(
              'description',
              'AuthScope StatefulWidget',
            ),
          ),
      );
}

// STATE
class AuthScopeState extends State<AuthScope> {
  late Stream<User?> authStateChanges;

  @override
  void initState() {
    super.initState();
    // Первичная инициализация виджета
    authStateChanges = FirebaseAuth.instance.authStateChanges();
  }

  @override
  void didUpdateWidget(AuthScope oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Конфигурация виджета изменилась
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Изменилась конфигурация InheritedWidget'ов
    // Также вызывается после initState, но до build'а
  }

  @override
  void dispose() {
    // Перманетное удаление стейта из дерева
    super.dispose();
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) =>
      super.debugFillProperties(
        properties
          ..add(
            StringProperty(
              'description',
              '_AuthScopeState State<AuthScope>',
            ),
          ),
      );

  @override
  Widget build(BuildContext context) {
    return _AuthScopeIW(state: this, child: widget.child);
  }
}

// PERSISTANT
@immutable
class _AuthScopeIW extends InheritedWidget {
  final AuthScopeState state;

  const _AuthScopeIW({required this.state, required super.child});

  /// Find _AuthScopeScope in BuildContext
  static AuthScopeState? of(BuildContext context, {bool listen = true}) {
    final inheritedWidget = listen
        ? context.dependOnInheritedWidgetOfExactType<_AuthScopeIW>()
        : context
            .getElementForInheritedWidgetOfExactType<_AuthScopeIW>()
            ?.widget;
    return inheritedWidget is _AuthScopeIW ? inheritedWidget.state : null;
  }

  @override
  bool updateShouldNotify(_AuthScopeIW oldWidget) =>
      !identical(state, oldWidget.state) || state != oldWidget.state;

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) =>
      super.debugFillProperties(
        properties
          ..add(
            StringProperty(
              'description',
              'Scope of AuthScope',
            ),
          )
          ..add(
            ObjectFlagProperty<AuthScopeState>(
              '_AuthScopeState',
              state,
              ifNull: 'none',
            ),
          )
          ..defaultDiagnosticsTreeStyle = DiagnosticsTreeStyle.offstage,
      );
}
