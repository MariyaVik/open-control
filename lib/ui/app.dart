import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:open_control/ui/navigation/main_navigation.dart';

import '../mobX/common/common_state.dart';
import 'theme/theme.dart';

GlobalKey<NavigatorState> mainNavigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => CommonState()),
        // Provider(create: (context) => PlacesState(PlaceAPI())),
        // Provider(create: (context) => EventsState(EventsAPI())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: themeLight,
        navigatorKey: mainNavigatorKey,
        initialRoute: AppNavigation.initialRoute,
        onGenerateRoute: AppNavigation.onGenerateRoute,
      ),
    );
  }
}
