import 'dart:io';

String readJson(String name) {
  var dir = Directory.current.path;
  if (dir.endsWith('data')) {
    return File('$dir/test/$name').readAsStringSync();
  }
  return File('$dir/data/test/$name').readAsStringSync();
}
