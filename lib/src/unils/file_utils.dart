import 'dart:async';
import 'dart:io';

/// utility methods for file operations related to managing
/// a counter stored in a file.
base class FideTmpUtils {
  final String pakcName;

  ///
  static const List<String> _cache = [
    '.dart_tool',
    'build',
    'generated',
  ];
  const FideTmpUtils(this.pakcName);

  /// creating a file with the specified contents at
  /// a given path within the project
  ///
  Future<void> createFileCounter(
    final String pathInProj,
    final String contents, [
    bool isToChache = true,
  ]) async {
    try {
      if (pathInProj.contains(Directory.current.path)) {
        throw Exception(
            'It is necessary to provide a relative path, not an absolute path, to the file.\n$pathInProj');
      }
      final path = <String>[
        Directory.current.path,
        if (isToChache) ..._cache,
        pakcName,
        pathInProj,
      ].join(Platform.pathSeparator);
      final file = File(path);

      if (await file.exists()) await file.delete();

      await file.writeAsString(contents);
    } on Exception catch (e, t) {
      throw Exception('$e\n$t');
    }
  }

  /// Designed to decrement a counter stored in a file by
  /// removing one occurrence of the newline character ('\n')
  /// from the beginning of the file's contents. Below is a
  /// breakdown of its functionality:
  Future<bool> decrementing(
    final String pathInProj, [
    bool isToChache = true,
  ]) async {
    try {
      final path = <String>[
        Directory.current.path,
        if (isToChache) ..._cache,
        pakcName,
        pathInProj,
      ].join(Platform.pathSeparator);

      final file = File(path);

      if (await file.exists()) {
        final lines = file.readAsLinesSync();
        if (lines.length > 1) {
          lines.removeAt(0);
          final newContent = lines.join('\n');
          File(file.path).writeAsStringSync(newContent);
          return false;
        }
        return true;
      }
      return false;
    } catch (e) {
      throw Exception('$e');
    }
  }
}
