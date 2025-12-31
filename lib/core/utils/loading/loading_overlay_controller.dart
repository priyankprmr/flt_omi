import 'package:flutter/foundation.dart' show immutable;

typedef CloseLoadingScreen = bool Function();

@immutable
class LoadingOverlayController {
  final CloseLoadingScreen close;

  const LoadingOverlayController({required this.close});
}
