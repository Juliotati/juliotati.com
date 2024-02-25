import 'dart:math' as math;

extension IterableExt<E> on Iterable<E> {
  E get randomElement {
    return elementAt(math.Random().nextInt(length));
  }
}
