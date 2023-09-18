import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:wordwolf/page/root/root_page.dart';

/// ページ遷移のプロバイダ
final routerProvider = Provider<GoRouter>(
  (ref) => GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const RootPage(),
        routes: [
          // GoRoute(
          //   path: 'night',
          //   builder: (context, state) =>
          //       NightPage(roomId: state.extra! as String),
          // ),
        ],
      ),
    ],
  ),
);
