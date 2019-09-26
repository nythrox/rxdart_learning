import 'package:rxdart/rxdart.dart';

main() {
  //ConcatStream turns a list of streams into a single stream
  //it subscribes to a stream, emits the events of that stream, then goes to the next if the stream closed.  
  
  final behaviorSubject = BehaviorSubject<String>();
  final behaviorSubject2 = BehaviorSubject<String>();
  final behaviorSubject3 = BehaviorSubject<String>();

  ConcatStream([
    behaviorSubject,
    behaviorSubject2,
    behaviorSubject3,
    Stream.fromIterable(["he", "ho", "hu"])
  ]).listen((res) => print(res));
  //prints ye, yee, yeet, he, ho, hu

  behaviorSubject.add("ye");
  behaviorSubject.close();

  behaviorSubject2.add("yee");
  behaviorSubject2.close();

  behaviorSubject3.add("yeet");
  behaviorSubject3.close();
}
