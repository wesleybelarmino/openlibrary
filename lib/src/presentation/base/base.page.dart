import 'package:dartz/dartz.dart' hide State;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart' as mobx;
import 'package:openlibrary/src/controller/base.store.dart';
import 'package:openlibrary/src/di/injection.dart';
import 'package:openlibrary/src/presentation/base/reaction.dart';
import 'package:openlibrary/src/presentation/ui/error_overlay.ui.dart';

abstract class BaseState<T extends StatefulWidget, S extends BaseStore>
    extends State<T> {
  final S? controller;

  @nonVirtual
  List<mobx.ReactionDisposer> disposers = [];

  //Roda a função ao abrir a página e também quando algum dos observables for alterdo
  final List<void Function()> autoRun = [];

  //Roda a função sempre que algum observables for alterado.
  final List<Reaction> reaction = [];

  //When só roda uma vez e depois que a condição é satisfeita e chama o dispose automaticamente
  final List<Tuple2<bool Function(mobx.Reaction _), void Function()>> when = [];

  BaseState({S? controller})
      : controller = controller ?? (S == BaseStore ? null : getIt<S>());

  Widget layout(BuildContext ctx);

  PreferredSizeWidget appBar(BuildContext ctx);
  PreferredSizeWidget _buildAppBar(BuildContext ctx) => appBar(ctx);

  final enableLoadingOverlay = true;
  final enableErrorOverlay = true;

  @override
  @mustCallSuper
  void initState() {
    disposers.addAll(autoRun.map((func) => mobx.autorun((_) => func)));
    disposers.addAll(reaction.map((reaction) => reaction.toReaction()));
    disposers
        .addAll(when.map((tuple) => mobx.when(tuple.value1, tuple.value2)));

    super.initState();
  }

  void disposeFunc() {
    for (final dispose in disposers) {
      dispose();
    }
    controller?.onDispose();
  }

  @override
  void dispose() {
    disposeFunc();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _appBar = _buildAppBar(context);
    return Stack(
      fit: StackFit.expand,
      children: [
        Scaffold(
          appBar: _appBar,
          body: layout(context),
        ),
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
