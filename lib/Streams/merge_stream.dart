import 'package:rxdart/rxdart.dart';
main() {

  //Merge turns all of the streams into one single stream with one output, and the order of the streams doesnt matter, the timing is always correct


  final behaviorSubject = BehaviorSubject<int>();
  final behaviorSubject2 = BehaviorSubject<int>();
  final behaviorSubject3 = BehaviorSubject<int>();

  behaviorSubject3.add(1);
  behaviorSubject.add(2);
  behaviorSubject2.add(3);
  
  MergeStream([
    behaviorSubject,
    behaviorSubject2,
    behaviorSubject3
  ]).listen(print);
  //1, 2, 3, 1, 2, 3

  behaviorSubject3.add(1);
  behaviorSubject.add(2);
  behaviorSubject2.add(3);

}
