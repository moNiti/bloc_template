import 'dart:convert';

class AppPath {
  static const Path login = Path(name: "login", path: "/");
  static const Path home = Path(name: "home", path: "home");
}

class Path {
  final String name;
  final String path;
  const Path({
    required this.name,
    required this.path,
  });

  Path copyWith({
    String? name,
    String? path,
  }) {
    return Path(
      name: name ?? this.name,
      path: path ?? this.path,
    );
  }
}
