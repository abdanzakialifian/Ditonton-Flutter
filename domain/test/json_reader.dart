import 'dart:io';

String readJson(String name) {
  var dir = "../domain";
  if (dir.endsWith('/test')) {
    dir = dir.replaceAll('/test', '');
  }
  return File('$dir/test/$name').readAsStringSync();
}
