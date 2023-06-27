import 'dart:developer';

import 'package:beco/repositories/auth_repository.dart';
import 'package:beco/screens/bookroom_screen.dart';
import 'package:beco/screens/dash_screen.dart';
import 'package:beco/screens/flexible_search_screen.dart';
import 'package:beco/screens/login_screen.dart';
import 'package:beco/screens/pagenotfound_screen.dart';
import 'package:beco/screens/primeuser_screen.dart';
import 'package:beco/screens/room_confirm_screen.dart';
import 'package:beco/screens/roomdetails_screen.dart';
import 'package:beco/screens/search_screen.dart';
import 'package:beco/screens/searchlocation_screen.dart';
import 'package:beco/screens/searchresult_screen.dart';
import 'package:beco/services/bloc/auth_bloc.dart';
import 'package:beco/services/cubit/flexsearch_cubit.dart';
import 'package:beco/services/cubit/theme_cubit.dart';
import 'package:beco/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // final bool isAuthenticated = true;
  // final bool isUserPrime = false;
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthRepository>(
            create: (context) => AuthRepository())
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<ThemeCubit>(create: (context) => ThemeCubit()),
          BlocProvider<AuthBloc>(
            create: (context) => AuthBloc(
              RepositoryProvider.of<AuthRepository>(context, listen: false),
            ),
          ),
          BlocProvider(create: (context) => FlexsearchCubit()),
        ],
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            return BlocBuilder<ThemeCubit, bool>(
                builder: (context, isDarkTheme) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Flutter Demo',
                theme: isDarkTheme ? darkTheme : lightTheme,
                initialRoute: state is AuthInitial
                    ? state.user.isAuthenticated
                        ? '/'
                        : '/login'
                    : '/login',
                routes: state is AuthInitial
                    ? state.user.isAuthenticated
                        ? {
                            '/': (context) => const DashScreen(),
                            '/search': (context) => const SearchScreen(),
                            '/details': (context) => const RoomDetailsScreen(),
                            '/bookRoom': (context) => const BookRoomScreen(),
                            '/flex-search': (context) =>
                                const FlexibleSearchScreen(),
                            '/searchbylocation': (context) =>
                                const SearchLocationScreen(),
                            '/result': (context) => const SearchResultScreen(),
                            '/confirm': (context) => const RoomConfirmScreen(),
                          }
                        : {
                            '/login': (context) => const LoginScreen(),
                          }
                    : {},
                onGenerateRoute: (RouteSettings settings) {
                  if (state is AuthInitial) {
                    log(settings.name!);
                    if (state.user.isPrimeUser) {
                      return MaterialPageRoute(
                          builder: (context) => const PrimeUserScreen());
                    }
                    return null;
                  }
                  return MaterialPageRoute(
                      builder: (context) => const LoginScreen());
                },
                onUnknownRoute: (RouteSettings setting) {
                  return MaterialPageRoute(
                    builder: ((BuildContext context) =>
                        const PageNotFoundScreen()),
                  );
                },
              );
            });
          },
        ),
      ),
    );
  }
}
