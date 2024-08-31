import 'package:juliotati/core/config/providers/app_settings_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> get appProviders {
  return [
    ListenableProvider(create: (_) => AppSettingsProvider()),
  ];
}
