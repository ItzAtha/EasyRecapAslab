class AppRoutes {
  AppRoutes._();

  // ============[ Navigation route ]============
  static const ({String name, String path}) homeRoute = (path: '/home', name: "home");
  static const ({String name, String path}) classRoute = (path: '/class', name: "class");
  static const ({String name, String path}) activityRoute = (path: '/activity', name: "activity");
  static const ({String name, String path}) settingsRoute = (path: '/settings', name: "settings");
}
