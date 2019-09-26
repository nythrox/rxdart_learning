import 'package:rxdart/rxdart.dart';

main() {

  //Zip stream gets the last values of streams and lets you combine them.
  //If you have 3 streams in zip, it will only emit a new transformed stream when all 3 streams gain new values
  
  final behaviorSubject = BehaviorSubject<String>();
  final behaviorSubject2 = BehaviorSubject<String>();
  final behaviorSubject3 = BehaviorSubject<String>();

  ZipStream([
    behaviorSubject,
    behaviorSubject2,
    behaviorSubject3
  ], (res) => res.join()).listen(print);
// 1 2 3
// 4 5 6
  
  behaviorSubject.add("1 ");
  behaviorSubject2.add("2 ");
  behaviorSubject3.add("3 ");
  behaviorSubject.add("4 ");
  behaviorSubject2.add("5 ");
  behaviorSubject3.add("6 ");

  
  
  // behaviorSubject.add("1 ");
  // behaviorSubject2.add("2 ");
  // behaviorSubject3.add("3 ");
  // behaviorSubject.add("4 ");
  // behaviorSubject2.add("5 ");

  //1 2 3
}
