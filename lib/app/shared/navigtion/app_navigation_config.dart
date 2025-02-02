import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:general_app/app/features/index.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');

class AppRouters {
  static const intiial = "/";
  static const start = "/start";
  static const auth = "/auth";
  static const signIn = "/login";
  static const register = "/register";
  static const home = "/home";
  static const calendar = "/calendar";
  static const calculator = "/calculator";
  static const chats = "/chats";
  static const chatDetails = "chatDetails";
  static const createConversation = "createConversation";
  static const musics = "/musics";
  static const more = "/more";
  static const settings = "settings";
  static const profile = "profile";
}

class AppRouterConfig {
  static final goRouter = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: AppRouters.calendar,
    redirect: (context, state) async {
      //  final authState = context.read<AuthenticationCubit>().state;

      // if (authState.status == AuthenticationStatus.unauthenticated) {
      //   return AppRouters.signIn;
      // }
      // if (state.matchedLocation == AppRouters.signIn) {
      //   return AppRouters.home;
      // }

      return null;
    },
    routes: <RouteBase>[
      // GoRoute(
      //   path: AppRouters.signIn,
      //   builder: (context, state) => const LoginScreen(),
      // ),
      StatefulShellRoute.indexedStack(
        builder: (BuildContext context, GoRouterState state,
            StatefulNavigationShell navigationShell) {
          return MainScreen(navigationShell: navigationShell);
        },
        branches: [
          // StatefulShellBranch(
          //   routes: [
          //     GoRoute(
          //       path: AppRouters.home,
          //       builder: (context, state) => const HomeScreen(),
          //     ),
          //   ],
          // ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRouters.calendar,
                builder: (context, state) => BlocProvider(
                    create: (_) => CalendarCubit(),
                    child: const CalendarScreen()),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRouters.calculator,
                builder: (context, state) => BlocProvider(
                    create: (_) => CalendarCubit(),
                    child: const CalculatorScreen()),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRouters.musics,
                builder: (context, state) => const MusicsScreen(),
              ),
            ],
          ),
          // StatefulShellBranch(
          //   routes: [
          //     GoRoute(
          //       path: AppRouters.chats,
          //       builder: (context, state) => const ChatScreen(),
          //       routes: [
          //         GoRoute(
          //           path: AppRouters.chatDetails,
          //           name: AppRouters.chatDetails,
          //           parentNavigatorKey: _rootNavigatorKey,
          //           pageBuilder: (context, state) => NoTransitionPage<void>(
          //               key: state.pageKey,
          //               child: ChatDetailsScreen(
          //                 groupId: state.uri.queryParameters['groupId'],
          //                 groupType: state.uri.queryParameters['groupType'],
          //                 groupName: state.uri.queryParameters['groupName'],
          //               )),
          //         ),
          //         GoRoute(
          //           path: AppRouters.createConversation,
          //           name: AppRouters.createConversation,
          //           parentNavigatorKey: _rootNavigatorKey,
          //           pageBuilder: (context, state) => NoTransitionPage<void>(
          //               key: state.pageKey,
          //               child: const CreateConversationScreen()),
          //         )
          //       ],
          //     ),
          //   ],
          // ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRouters.more,
                name: AppRouters.more,
                builder: (context, state) => const MoreScreen(),
                routes: [
                  // GoRoute(
                  //   path: AppRouters.profile,
                  //   parentNavigatorKey: _rootNavigatorKey,
                  //   //builder: (context, state) => const ProfileScreen(),
                  //   pageBuilder: (context, state) => NoTransitionPage<void>(
                  //       key: state.pageKey, child: const ProfileScreen()),
                  // ),
                  GoRoute(
                    path: AppRouters.settings,
                    name: AppRouters.settings,
                    parentNavigatorKey: _rootNavigatorKey,
                    //builder: (context, state) => const SettingsScreen(),
                    pageBuilder: (context, state) => NoTransitionPage<void>(
                        key: state.pageKey, child: const SettingsScreen()),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
