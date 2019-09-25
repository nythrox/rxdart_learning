import 'package:rxdart/rxdart.dart';

main() {

  //CombineLatestStream gets the value pushed to streams and lets you combine them.
  //The way the streams are combined depends what you choose and what method you use.
  //CombineLatestStream.list combines them to a list [a, b, c]
  //CombineLatesStream.combine3 lets gives you the three values and lets you decide return (a + b * c);

  final behaviorSubject = BehaviorSubject<int>();
  final behaviorSubject2 = BehaviorSubject<int>();
  final behaviorSubject3 = BehaviorSubject<int>();

  behaviorSubject3.add(1);
  behaviorSubject.add(1);
  behaviorSubject2.add(1);

  CombineLatestStream(
          [behaviorSubject, behaviorSubject2, behaviorSubject3], (value) => value)
      .listen(print);

  CombineLatestStream.combine3(
          behaviorSubject, behaviorSubject2, behaviorSubject3, (a, b, c) => a + b + c)
      .listen(print);

  behaviorSubject.add(2);
  behaviorSubject2.add(2);
  behaviorSubject3.add(2);
}
