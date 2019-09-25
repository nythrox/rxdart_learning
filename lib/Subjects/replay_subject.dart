import 'package:rxdart/rxdart.dart';

main(){
  //Replay subject stores all values added to it (even if you are not subscribed);
  //When you subscribe, it pushes all the values it had stored.
  final replaySubject = ReplaySubject();
  replaySubject.add("ReplaySubject:"+1.toString());
  replaySubject.add("ReplaySubject:"+2.toString());
  replaySubject.add("ReplaySubject:"+3.toString());
  replaySubject.add("ReplaySubject:"+4.toString());
  replaySubject.listen((d)=>print(d));
  replaySubject.add("ReplaySubject:"+5.toString());

}


