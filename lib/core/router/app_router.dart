import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mandi/core/locator.dart';
import 'package:mandi/core/viewmodels/auth_view_model.dart';
import 'package:mandi/ui/views/home_view.dart';
import 'package:mandi/ui/views/login_view.dart';
import 'package:mandi/ui/views/privacy_policy_view.dart';
import 'package:mandi/ui/views/profile_view.dart';
import 'package:mandi/ui/views/registration_view.dart';
import 'package:mandi/ui/views/reservations_view.dart';
import 'package:mandi/ui/views/settings_view.dart';
import 'package:mandi/ui/views/shell_view.dart';

class AppRouter {
  final AuthViewModel _authViewModel = locator<AuthViewModel>();
  final GlobalKey<NavigatorState> _navigatorKey = locator<GlobalKey<NavigatorState>>();

  late final GoRouter router;

  AppRouter() {
    router = GoRouter(
      initialLocation: '/login',
      refreshListenable: _authViewModel.currentUser,
      navigatorKey: _navigatorKey,
      routes: [
        GoRoute(
          path: '/login',
          name: 'login',
          builder: (context, state) => LoginView(),
        ),
        GoRoute(
          path: '/register',
          name: 'register',
          builder: (context, state) => RegistrationView(),
        ),
        GoRoute(
          path: '/settings',
          name: 'settings',
          builder: (context, state) => SettingsView(),
        ),
        GoRoute(
          path: '/reservationsView',
          name: 'reservationsView',
          builder: (context, state) => ReservationsView(),
        ),
        GoRoute(
          path: '/privacyPolicyView',
          name: 'privacyPolicyView',
          builder: (context, state) => PrivacyPolicyView(),
        ),
        ShellRoute(
          builder: (context, state, child) => ShellView(child: child),
          routes: [
            GoRoute(
              path: '/home',
              name: 'home',
              pageBuilder: (context, state) => CustomTransitionPage(
                key: state.pageKey,
                child: HomeView(),
                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                  return FadeTransition(
                    opacity: animation,
                    child: child,
                  );
                },
                transitionDuration: Duration(milliseconds: 100),
              ),
            ),
            GoRoute(
              path: '/profile',
              name: 'profile',
              pageBuilder: (context, state) => CustomTransitionPage(
                key: state.pageKey,
                child: ProfileView(),
                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                  return FadeTransition(
                    opacity: animation,
                    child: child,
                  );
                },
                transitionDuration: Duration(milliseconds: 100),
              ),
            ),
          ],
        ),
      ],
      redirect: (context, state) {
        final isLoggedIn = _authViewModel.currentUser.value != null;
        final isGoingToLogin = state.matchedLocation == '/login';
        final isGoingToRegister = state.matchedLocation == '/register';

        if (!isLoggedIn && !isGoingToLogin && !isGoingToRegister) {
          return '/login';
        }

        if (isLoggedIn && (isGoingToLogin || isGoingToRegister)) {
          return '/home';
        }

        return null;
      },
    );
  }
}
