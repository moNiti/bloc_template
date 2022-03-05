import 'package:bloc_template/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:provider/provider.dart';

import 'core/router/app_router.dart';
import 'core/services/gql/gql_service.dart';
import 'core/services/shared_pref_service.dart';
import 'core/theme/theme_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  ThemeData savedTheme =
      await SharedPrefService().getTheme() ?? AppTheme.lightTheme;

  runApp(
    _buildRootWidget(savedTheme),
  );
}

Widget _buildRootWidget(ThemeData savedTheme) {
  GQLService gqlService = GQLService();
  return ChangeNotifierProvider(
      create: (_) => ThemeProvider(savedTheme),
      child: GraphQLProvider(
        client: gqlService.client,
        child: const CacheProvider(
          child: MyApp(),
        ),
      ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: context.watch<ThemeProvider>().getTheme(),
      routeInformationParser: AppRouter.router.routeInformationParser,
      routerDelegate: AppRouter.router.routerDelegate,
    );
  }
}
