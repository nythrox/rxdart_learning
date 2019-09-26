import 'package:rxdart/rxdart.dart';

main() {
  //Will emit only the items from the first stream to arrive.

  final replaySubject = ReplaySubject();
  replaySubject.add(1);
  replaySubject.add(2);
  final replaySubject2 = ReplaySubject();
  replaySubject2.add(10);
  replaySubject2.add(20);
  
  RaceStream([replaySubject, replaySubject2]).listen(print); //1, 2

}
