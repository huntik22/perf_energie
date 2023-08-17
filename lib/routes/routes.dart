import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:login/notFound_page.dart';
import 'package:login/mainpage/mainpage.dart';
import '../pilotage/entite/admin/screen_admin_pilotage.dart';
import '../pilotage/entite/entity_piloatage_main.dart';
import '../pilotage/accueil_pilotage.dart';
import '../loginpage.dart';
import '../notFound_page.dart';
import '../pilotage/entite/overview/screen_overview_pilotage.dart';
import '../pilotage/entite/performs/screen_pilotage_perform.dart';
import '../pilotage/entite/profil/screen_pilotage_profil.dart';
import '../pilotage/entite/suivi/screen_suivi_pilotage.dart';
import '../pilotage/entite/tableau_bord/screen_indicateur.dart';
import '../pilotage/entite/tableau_bord/screen_tableau_bord_pilotage.dart';
import '../resetPasswd/entre_code_reset.dart';
import '../mainpage/mainpage.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');


  class RouteClass {
  static final router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/account/login', //'/account/login',
    errorBuilder: (context, state) {
      return  PageNotFound();
    },
    routes: [
      GoRoute(
          path: '/',
          pageBuilder: (context, state) => NoTransitionPage<void>(
            key: state.pageKey,
            restorationId: state.pageKey.value,
            child: const Mainpage(),
          ),
      ),
      GoRoute(
          path: '/pilotage',
          pageBuilder: (context, state) => NoTransitionPage<void>(
            key: state.pageKey,
            restorationId: state.pageKey.value,
            child: const PilotageHome(),
          ),
          routes: [
            GoRoute(
                path: 'espace/ayame',
                name: "Ayamé",
                pageBuilder: (context, state) => NoTransitionPage<void>(
                    key: state.pageKey,
                    restorationId: state.pageKey.value,
                    child: PageNotFound() //const PilotageEntiteOverview(urlPath: "profil"),
                ),
                routes:[
                  ShellRoute(
                    navigatorKey: _shellNavigatorKey,
                    builder: (BuildContext context, GoRouterState state, Widget child) {
                      return EntityPilotageMain(child: child);
                    },
                    routes: <RouteBase>[
                      GoRoute(
                        path: 'accueil',
                        pageBuilder: (context, state) => NoTransitionPage<void>(
                            key: state.pageKey,
                            child: const ScreenOverviewPilotage()
                        ),
                      ),
                      GoRoute(
                        path: 'tableau-de-bord',
                        pageBuilder: (context, state) => NoTransitionPage<void>(
                            key: state.pageKey,
                            child: const ScreenTableauBordPilotage()
                        ),
                        routes:[
                          GoRoute(
                            path: 'indicateurs',
                            pageBuilder: (context, state) => NoTransitionPage<void>(
                            key: state.pageKey,
                            child: const ScreenTableauBordIndicateur()))

                        ]
                      ),
                      GoRoute(
                        path: 'profil',
                        pageBuilder: (context, state) => NoTransitionPage<void>(
                            key: state.pageKey,
                            child: ScreenPilotageProfil()
                        ),
                      ),
                      //
                      GoRoute(
                        path: 'performances',
                        pageBuilder: (context, state) => NoTransitionPage<void>(
                            key: state.pageKey,
                            child: const ScreenPilotagePerform()
                        ),
                      ),
                      GoRoute(
                        path: 'suivi-des-donnees',
                        pageBuilder: (context, state) => NoTransitionPage<void>(
                            key: state.pageKey,
                            child: const ScreenPilotageSuivi()
                        ),
                      ),
                      GoRoute(
                        path: 'admin',
                        pageBuilder: (context, state) => NoTransitionPage<void>(
                            key: state.pageKey,
                            child: const ScreenPilotageAdmin()
                        ),
                      ),
                    ],
                  ),
                ]
            ),
          ]),
      GoRoute(
          path: '/account/login',
          pageBuilder: (context, state) => NoTransitionPage<void>(
            key: state.pageKey,
            restorationId: state.pageKey.value,
            child: const LogPage(),
          )
      ),
      GoRoute(
          path: '/account/forgot-password',
          pageBuilder: (context, state) => NoTransitionPage<void>(
            key: state.pageKey,
            restorationId: state.pageKey.value,
            child: const ForgotPasswd(),
          )
      ),
    ],
    redirect: (context ,state) async{
      //faire de sorte que s'il tape comme url /account/forgot-password cela puisse marcher
      if (state.fullPath=="/account/forgot-password"){
        return null;
      }

      final storage = new FlutterSecureStorage();
      String? loggedPref = await storage.read(key: 'logged');

      if (loggedPref != null && loggedPref == "true") {
        return null;
      }
      return "/account/login";
      // final SharedPreferences prefs = await SharedPreferences.getInstance();
      // final bool? loggedPref = prefs.getBool('logged');
      // if (loggedPref == null || loggedPref == false) {
      //   return "/account/login";
      // }

    },

  );
}

/* class RouteClass {
  static final router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/account/login', //'/account/login',
    errorBuilder: (context, state) {
      return const PageNotFound();
    },
    routes: [
      GoRoute(
        path: '/',
        pageBuilder: (context, state) => NoTransitionPage<void>(
          key: state.pageKey,
          restorationId: state.pageKey.value,
          child: const Mainpage(),
        ),
      ),

      GoRoute(
          path: '/pilotage',
          pageBuilder: (context, state) => NoTransitionPage<void>(
            key: state.pageKey,
            restorationId: state.pageKey.value,
            child: const PilotageHome(),
          ),
          routes: [
            GoRoute(
                path: 'espace/ayame',
                name: "Ayamé",
                pageBuilder: (context, state) => NoTransitionPage<void>(
                    key: state.pageKey,
                    restorationId: state.pageKey.value,
                    child:EntityPilotageMain () //const PilotageEntiteOverview(urlPath: "profil"),
                ),
                routes:[
                  /* GoRoute(
                        path: 'accueil',
                        pageBuilder: (context, state) => NoTransitionPage<void>(
                            key: state.pageKey,
                            child: const EntityPilotageMain()
                        ),
                      ), */
                      GoRoute(
                        path: 'tableau-de-bord',
                        pageBuilder: (context, state) => NoTransitionPage<void>(
                            key: state.pageKey,
                            child: const /* ScreenTableauBordPilotage */Mainpage()
                        ),
                      ),
                      GoRoute(
                        path: 'profil',
                        pageBuilder: (context, state) => NoTransitionPage<void>(
                            key: state.pageKey,
                            child: /* ScreenPilotageProfil */PageNotFound()
                        ),
                      ),
                      //
                      GoRoute(
                        path: 'performances',
                        pageBuilder: (context, state) => NoTransitionPage<void>(
                            key: state.pageKey,
                            child: const /* ScreenPilotagePerform */PageNotFound()
                        ),
                      ),
                      GoRoute(
                        path: 'suivi-des-donnees',
                        pageBuilder: (context, state) => NoTransitionPage<void>(
                            key: state.pageKey,
                            child: const /* ScreenPilotageSuivi */PageNotFound()
                        ),
                      ),
                      GoRoute(
                        path: 'admin',
                        pageBuilder: (context, state) => NoTransitionPage<void>(
                            key: state.pageKey,
                            child: const /* ScreenPilotageAdmin */ PageNotFound()
                        ),
                      ),
                  /* routes: <RouteBase>[
                      
                    ],
                  ShellRoute(
                    navigatorKey: _shellNavigatorKey,
                    builder: (BuildContext context, GoRouterState state, Widget child) {
                      return EntityPilotageMain(child: child);
                    },
                    
                  ), */
                ]
            ),
          ]),
      
      GoRoute(
          path: '/account/login',
          pageBuilder: (context, state) => NoTransitionPage<void>(
                key: state.pageKey,
                restorationId: state.pageKey.value,
                child: const LogPage() ,
              )),
      GoRoute(
          path: '/account/forgot-password',
          pageBuilder: (context, state) => NoTransitionPage<void>(
                key: state.pageKey,
                restorationId: state.pageKey.value,
                child: const ForgotPasswd(),
              )),
    ],
    redirect: (context, state) async {
      if (state.fullPath == "/account/forgot-password") {
        return "/account/forgot-password";
      }
      final storage = new FlutterSecureStorage();
      String? loggedPref = await storage.read(key: 'logged');

      if (loggedPref != null && loggedPref == "true") {
        return null;
      }
      return "/account/login"; 
    },
  );
} */
