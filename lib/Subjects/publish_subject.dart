import 'package:rxdart/rxdart.dart';

main(){
  //PublishSubject no values. It only pushes values if you are subscribed to it;
  final publishSubject = PublishSubject();
  publishSubject.add("PublishSubject:"+1.toString());
  publishSubject.add("PublishSubject:"+2.toString());
  publishSubject.add("PublishSubject:"+3.toString());
  publishSubject.add("PublishSubject:"+4.toString());
  publishSubject.listen((d)=>print(d));
  publishSubject.add("PublishSubject:"+5.toString());

}


