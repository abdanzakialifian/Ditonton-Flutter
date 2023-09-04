import 'dart:io';

String readJson(String name) {
  var dir = Directory.current.path;
  if (dir.endsWith('presentation')) {
    return File('$dir/test/$name').readAsStringSync();
  }
  return File('$dir/presentation/test/$name').readAsStringSync();
}
