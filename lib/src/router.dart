import 'package:my_garage/src/garage/infra/models/auto.dart';
import 'package:my_garage/src/garage/ui/screens/garage_add_screen.dart';
import 'package:my_garage/src/garage/ui/screens/garage_auto_screen.dart';
import 'package:my_garage/src/garage/ui/screens/garage_screen.dart';
import 'package:my_garage/src/internal/infra/extensions/string_x.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';

export 'package:go_router/go_router.dart';

part 'route_name.dart';

@module
abstract class RouterInjectableModule {
  @lazySingleton
  GoRouter router() {
    return GoRouter(
      initialLocation: RouteName.garage.path,
      routes: [
        GoRoute(
          path: RouteName.garage.path,
          name: RouteName.garage.name,
          builder: (_, state) => GarageScreen(key: state.pageKey),
          routes: [
            GoRoute(
              path: RouteName.garageAdd.path,
              name: RouteName.garageAdd.name,
              builder: (_, state) => GarageAddScreen(key: state.pageKey),
            ),
            GoRoute(
              path: RouteName.garageAuto.path,
              name: RouteName.garageAuto.name,
              builder: (_, state) => GarageAutoScreen(
                key: state.pageKey,
                auto: state.extra as Auto,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
