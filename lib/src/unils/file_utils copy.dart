// import 'dart:async';
// import 'dart:io';

// /// Utility class for file operations related to managing a counter stored in a file.
// ///
// /// utility methods for file operations related to managing
// /// a counter stored in a file.
// base class CounterFileUtils {
//   // final String pakcName;

//   // ///
//   // static const List<String> _cache = [
//   //   '.dart_tool',
//   //   'build',
//   //   'generated',
//   // ];
//   // const CounterFileUtils(this.pakcName);

//   // /// creating a file with the specified contents at
//   // /// a given path within the project
//   // ///
//   // Future<void> createFileCounter(
//   //   final String pathInProj,
//   //   final String contents, [
//   //   bool isToChache = true,
//   // ]) async {
//   //   try {
//   //     if (pathInProj.contains(Directory.current.path)) {
//   //       throw Exception('It is necessary to provide a relative path, not an absolute path, to the file.\n$pathInProj');
//   //     }
//   //     final path = <String>[
//   //       Directory.current.path,
//   //       if (isToChache) ..._cache,
//   //       pakcName,
//   //       pathInProj,
//   //     ].join(Platform.pathSeparator);
//   //     final file = File(path);

//   //     if (await file.exists()) await file.delete();

//   //     await file.writeAsString(contents);
//   //   } on Exception catch (e, t) {
//   //     throw Exception('$e\n$t');
//   //   }
//   // }

//   // Future<bool> decrementing(
//   //   final String pathInProj, [
//   //   bool isToChache = true,
//   // ]) async {
//   //   try {
//   //     final path = <String>[
//   //       Directory.current.path,
//   //       if (isToChache) ..._cache,
//   //       pakcName,
//   //       pathInProj,
//   //     ].join(Platform.pathSeparator);
//   //     final file = File(path);

//   //     if (await file.exists()) {
//   //       final lines = file.readAsLinesSync();
//   //       if (lines.isNotEmpty) {
//   //         lines.removeAt(0);
//   //         final newContent = lines.join('\n');
//   //         // await file.writeAsString(newContent);
//   //         File(file.path).writeAsStringSync(newContent);

//   //         return false;
//   //       } else {
//   //         return true;
//   //       }
//   //     } else {
//   //       return false;
//   //     }
//   //   } catch (e) {
//   //     throw Exception('$e');
//   //   }
//   // }
//   final String packageName;

//   /// List of cache directories.
//   static const List<String> _cache = [
//     '.dart_tool',
//     'build',
//     'generated',
//   ];

//   /// Constructor for CounterFileUtils.
//   const CounterFileUtils(this.packageName);

//   /// Creates a file with the specified contents at a given path within the project.
//   ///
//   /// The [pathInProj] parameter specifies the path within the project to create the file.
//   /// The [contents] parameter specifies the contents of the file to be created.
//   /// The [isToCache] parameter indicates whether to use cache directories.
//   ///
//   /// Throws an [Exception] if an error occurs during file creation.
//   Future<void> createCounterFile(
//     final String pathInProj,
//     final String contents, [
//     final bool isToCache = true,
//   ]) async {
//     try {
//       if (pathInProj.contains(Directory.current.path)) {
//         throw Exception(
//             'Please provide a relative path, not an absolute path, to the file.\n$pathInProj');
//       }
//       final path = <String>[
//         Directory.current.path,
//         if (isToCache) ..._cache,
//         packageName,
//         pathInProj,
//       ].join(Platform.pathSeparator);
//       final file = File(path);

//       if (await file.exists()) {
//         await file.delete();
//       }

//       await file.writeAsString(contents);
//     } catch (e, t) {
//       throw Exception('$e\n$t');
//     }
//   }

//   /// Decrements the counter stored in a file.
//   ///
//   /// The [pathInProj] parameter specifies the path to the counter file within the project.
//   /// The [isToCache] parameter indicates whether to use cache directories.
//   ///
//   /// Returns `true` if the counter file is empty after decrementing, `false` otherwise.
//   ///
//   /// Throws an [Exception] if an error occurs during the decrement operation.
//   Future<bool> decrementCounter(
//     final String pathInProj, [
//     final bool isToCache = true,
//   ]) async {
//     try {
//       final path = <String>[
//         Directory.current.path,
//         if (isToCache) ..._cache,
//         packageName,
//         pathInProj,
//       ].join(Platform.pathSeparator);
//       final file = File(path);

//       if (await file.exists()) {
//         final lines = file.readAsLinesSync();
//         if (lines.isNotEmpty) {
//           lines.removeAt(0);
//           final newContent = lines.join('\n');
//           await file.writeAsString(newContent);
//           return false;
//         } else {
//           return true;
//         }
//       } else {
//         return false;
//       }
//     } catch (e) {
//       throw Exception('$e');
//     }
//   }
// }
