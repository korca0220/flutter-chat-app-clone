class Route {
  Route({
    required this.name,
    required this.path,
  });
  final String name;
  final String path;
}

abstract class CommonRouteList {
  static final home = Route(name: 'home', path: '/');
  static final login = Route(name: 'login', path: '/login');
}
