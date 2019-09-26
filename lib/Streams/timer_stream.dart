import 'package:rxdart/rxdart.dart';

main() {
  //TimerStream will emit a value after a certain amount of time
  
  TimerStream("gigigig",Duration(seconds: 1)).listen(print);

}
