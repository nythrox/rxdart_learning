import 'package:rxdart/rxdart.dart';

main() {
  //ForkJoin will get the final value from streams and combine them into an array, or in a combination you want.

  final behaviorSubject = BehaviorSubject<String>();
  behaviorSubject.add("fine");
  behaviorSubject.close();

  ForkJoinStream([
    Observable.fromIterable(["hi", "hello"]),
    Observable.just("how are you doing"),
    behaviorSubject
  ], (res) => res).listen(print);
//[hello, how are you doing, fine]

}
