import 'dart:io';

String readJson(String name) {
  var dir =
      "/Users/abdanzakialifian/Projects/Flutter Project/Ditonton Calogue Movie TvShow/domain";
  if (dir.endsWith('/test')) {
    dir = dir.replaceAll('/test', '');
  }
  return File('$dir/test/$name').readAsStringSync();
}
