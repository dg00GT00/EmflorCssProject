import 'css_writer.dart';
import 'logger.dart';
import 'sass_watcher.dart';

Future<void> main(List<String> args) async {
  final logger = DefaultLogger();
  final sassWatcher = SassWatcher(logger: logger);
  await sassWatcher.buildWatcherStreamsAsync();
  sassWatcher.watch(CssWriter(logger: logger), args.first);
}
