import 'package:rxdart/rxdart.dart';

main(){
  //BehaviorSubject subject stores the last value added to it (even if you are not subscribed);
  //When you subscribe, it pushes the stored value.
  final behaviorSubject = BehaviorSubject();
  behaviorSubject.add("BehaviorSubject:"+1.toString());
  behaviorSubject.add("BehaviorSubject:"+2.toString());
  behaviorSubject.add("BehaviorSubject:"+3.toString());
  behaviorSubject.add("BehaviorSubject:"+4.toString());
  behaviorSubject.listen((d)=>print(d));
  behaviorSubject.add("BehaviorSubject:"+5.toString());

}


