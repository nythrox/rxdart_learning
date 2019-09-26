import 'package:rxdart/rxdart.dart';

main() {
  //DeferStream waits until someone subscribes to it to return its stream
  //can be useful if you if you want to wait until the last moment to generate the data
  
  final deferStream = DeferStream(()=>Observable.just("hi"));

  deferStream.listen(print);

}
