import 'package:bloc_demo/main_export.dart';

extension ExtensionOnInt on int {
  SizedBox hp() => SizedBox(height: toDouble());

  SizedBox wp() => SizedBox(width: toDouble());
}
