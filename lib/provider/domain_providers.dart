import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fukuda_fuzai/page/game/game_page.dart';
import 'package:fukuda_fuzai/page/qr/qr_page.dart';
import 'package:fukuda_fuzai/page/title/title_page.dart';
import 'package:go_router/go_router.dart';

/// ページ遷移のプロバイダ
final routerProvider = Provider<GoRouter>(
  (ref) => GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const TitlePage(),
        routes: [
          GoRoute(
            path: 'qr',
            builder: (context, state) => const QrPage(),
          ),
          GoRoute(
            path: 'game',
            builder: (context, state) =>  GamePage(state.extra as String),
          ),
        ],
      ),
    ],
  ),
);
