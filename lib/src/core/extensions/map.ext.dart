extension MapExtenstion<T, S> on Map<T, S>? {
  O getValue<O>(String key, O defaultValue) {
    final value = this?[key] as O?;
    return value ?? defaultValue;
  }
}
