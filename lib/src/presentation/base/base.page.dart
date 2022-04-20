import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:openlibrary/src/controller/base.store.dart';
import 'package:openlibrary/src/di/injection.dart';
import 'package:openlibrary/src/presentation/ui/error_overlay.ui.dart';
import 'package:openlibrary/src/presentation/ui/loading_overlay.ui.dart';

abstract class BaseState<T extends StatefulWidget, S extends BaseStore>
    extends State<T> {
  final S? controller;

  BaseState({S? controller})
      : controller = controller ?? (S == BaseStore ? null : getIt<S>());

  Widget layout(BuildContext ctx);

  final enableLoadingOverlay = true;
  final enableErrorOverlay = true;

  void disposeFunc() {
    controller?.onDispose();
  }

  @override
  void dispose() {
    disposeFunc();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        layout(context),
        if (enableLoadingOverlay && controller != null)
          Observer(builder: (_) {
            return controller!.isLoading
                ? const LoadingOverlay()
                : const SizedBox.shrink();
          }),
        if (enableErrorOverlay && controller != null)
          Observer(
            builder: (_) {
              return controller!.hasFailure
                  ? ErrorOverlay(
                      failure: controller!.failure,
                      clearErroState: controller!.clearErros,
                    )
                  : const SizedBox.shrink();
            },
          ),
      ],
    );
  }
}
