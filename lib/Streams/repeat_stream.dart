import 'package:rxdart/rxdart.dart';

main() {
  //RepeatStream will recreate a closed stream and emit its events a certain number of times. 
  final behaviorSubject = BehaviorSubject();
  behaviorSubject.add("hi");
  behaviorSubject.close();
  // RepeatStream((i)=>Observable.fromIterable([1,2,5,4,5]),2).listen(print);
  RepeatStream((i)=>behaviorSubject,3).listen((res)=>print(res));
  //hi, hi, hi
}
