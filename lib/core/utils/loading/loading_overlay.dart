import 'package:flt_omi/core/constants/app_texts.dart';
import 'package:flt_omi/core/utils/loading/loading_overlay_controller.dart';
import 'package:flutter/material.dart';

class LoadingOverlay {
  LoadingOverlay._sharedInstance();

  static final LoadingOverlay _shared = LoadingOverlay._sharedInstance();

  factory LoadingOverlay.instance() => _shared;

  LoadingOverlayController? _controller;

  void show({required BuildContext context}) {
    if (_controller == null) {
      _controller = showOverlay(context: context);
    } else {
      return;
    }
  }

  void hide() {
    _controller?.close();
    _controller = null;
  }

  LoadingOverlayController showOverlay({
    required BuildContext context,
  }) {
    //OverlayState?
    final state = Overlay.of(context);

    final renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;

    final overlay = OverlayEntry(
      builder: (context) {
        return Material(
          color: Colors.black.withAlpha(150),
          child: Center(
            child: Container(
              constraints: BoxConstraints(
                maxWidth: size.width * 0.8,
                maxHeight: size.height * 0.8,
                minWidth: size.width * 0.5,
                minHeight: size.width * 0.5,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 10.0,
                    ),
                    const CircularProgressIndicator(),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      AppTexts.loading,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: Colors.black),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );

    state.insert(overlay);

    return LoadingOverlayController(
      close: () {
        overlay.remove();
        return true;
      },
    );
  }
}
