// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

/// Function is designed to display an error message in the command line interface.
/// It determines the platform (Windows or Unix-like), then runs the appropriate
/// command to display the error message with the specified color scheme.
void exitWitErrorCode(String msg) {
  final p = Platform.isWindows
      ? Process.run(
          'cmd',
          [
            '/c',
            'color 04 && echo $msg',
          ],
        )
      : Process.run(
          'bash',
          [
            '-c',
            'tput setaf 1; echo "$msg"',
          ],
        );
  p.then((d) {
    stdout.writeln(d.stdout);
    return exit(d.exitCode);
  });
}
