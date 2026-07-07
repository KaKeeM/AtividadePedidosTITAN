import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:larica_ufba/pages/welcome_page.dart';
import 'package:larica_ufba/pages/tasks_page.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const WelcomePage();
      },
    ),
    GoRoute(
      path: '/tasks',
      builder: (BuildContext context, GoRouterState state) {
        return const TasksPage();
      },
    ),
  ],
);