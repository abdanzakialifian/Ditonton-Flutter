import 'dart:io';

String readJson(String name) {
  var dir = Directory.current.path;
  if (dir.endsWith('domain')) {
    return File('$dir/test/$name').readAsStringSync();
  }
  return File('$dir/domain/test/$name').readAsStringSync();
}
