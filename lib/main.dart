import 'package:rxdart/rxdart.dart';

main() {
  //ConcatEagerStream turns a list of streams into a single stream
  //events captured are emitted at the correct time, after the previous stream finished emitting items and closed.

  final behaviorSubject = BehaviorSubject<String>();
  final behaviorSubject2 = BehaviorSubject<String>();
  final behaviorSubject3 = BehaviorSubject<String>();

  ConcatEagerStream([
    behaviorSubject,
    behaviorSubject2,
    behaviorSubject3,
    Stream.fromIterable(["he", "ho", "hu"])
  ]).listen((res) => print(res));

  behaviorSubject.add("ye");
  behaviorSubject.close();

  behaviorSubject2.add("yee");
  behaviorSubject2.close();

  behaviorSubject3.add("yeet");
  behaviorSubject3.close();
}
