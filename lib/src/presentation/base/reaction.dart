import 'package:mobx/mobx.dart' as mobx;

class Reaction<T> {
  final T Function(mobx.Reaction? _) reaction;
  final void Function(T value) effect;
  T? _lastResultReaction;

  Reaction(this.reaction, this.effect);

  mobx.ReactionDisposer toReaction() => mobx.reaction<T>(reaction, effect);

  void execut() {
    final result = reaction(null);
    if (result != _lastResultReaction) {
      effect(result);
      _lastResultReaction = result;
    }
  }
}
