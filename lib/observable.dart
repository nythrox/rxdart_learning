import 'dart:async';

import 'package:rxdart/rxdart.dart';
//most important ones: CombineLatest, Zip, Merge

main() {
  //combineLatest needs 2 to start working, after that will combine both when anyone has a new value
  //zip needs 2 to work, will only push when both have a new value

  //forkJoin will get the last 2 values only. will only work if both are closed.
  //concatenate does one after the other, and needs each one to close

  //merge does one after the other *my favorite:)
  //

  final replaySubject1 = ReplaySubject<int>();
  final replaySubject2 = ReplaySubject<int>();
  final publishSubject = PublishSubject<int>();

  replaySubject1.add(1);
  replaySubject1.add(2);

  replaySubject2.add(3);
  replaySubject2.add(4);
  
  publishSubject.add(5);
  publishSubject.add(6);

  //Static methods

  // Observable.combineLatest([replaySubject1, replaySubject2],(res)=>res).listen((res)=>print(res)); //[1,3], [2,3], [2,4]

  // Observable.zip([replaySubject1, replaySubject2], (res)=>res).listen(print); //[1,3], [2,4]

  // Observable.forkJoin([replaySubject1, replaySubject2], (res)=>res).listen(print); //wont print anything because both streams are open. If you close BOTH, it will print the last [2,4]

  // Observable.concat([replaySubject1, replaySubject2]).listen((res)=>print(res)); //1,2 will only print one stream because it needs it to close to go to the next

  // Observable.merge([replaySubject1, replaySubject2]).listen(print); // 1,2,3,4

  // Observable.race([replaySubject1, replaySubject2]).listen(print); //1, 2 (will only print the events of the first one to arrive)

  // Observable.repeat((i)=>replaySubject1.map((item) => item * i), 5).listen(print); //if stream were closed, would print 1,2,2,4,3,6,4,8,5,10.

  // Observable.periodic(Duration(milliseconds: 100),(i)=>i).listen(print); //1, 2, 3, 4, .... every 100 miliseconds

  // Observable.timer("hewwo", Duration(seconds: 1)).listen(print); //hewwo (after 1 second)

  // Observable.defer(()=>Observable.fromIterable(["1","2"])).listen(print); //1, 2 (defer only creates the observable as soon as someone subscribes to it)



  //Observable properties


  // replaySubject1.pipe(replaySubject2); //pipe transfers/adds the events of one stream to another
  // replaySubject2.listen(print); //3 4 1 2

  // replaySubject1.interval(Duration(seconds: 1)).listen(print); // 1, 2 (waits 1 second between each print)

  // replaySubject1.buffer(Stream.periodic(Duration(milliseconds:1000),(i)=>i)).listen((res){replaySubject1.add(1); return print(res);}); //[1,2],[1],[1],[1] holds all items emitted for 10 seconds, then prints them in an array. holds for 10 seconds, etc. Example to use: Hold items until a Stream connected to a button onPress event. That way it will only emit the items once you press a button.
  // replaySubject1.bufferTime(Duration(milliseconds:1000)).listen((res){replaySubject1.add(1); return print(res);}); //[1,2],[1],[1],[1] will hold events for 1 second, then print 
  // replaySubject1.bufferCount(2).listen(print); //[1,2] will hold 2 events, then print. hold 2 events, print 

  // replaySubject1.where((i) => i>1).listen(print); //2 will print events larger then 1

  // replaySubject1.take(1).listen(print); //1 provides first 1 number of the stream

  // replaySubject1.distinct().listen(print); //1,2 never provides two consecutive events that are equal 
  // replaySubject1.distinct((a,b)=> a != b).listen(print); //1 if a != b then its repeated, and skip it 
  
  // replaySubject1.skip(1).listen(print); //2 skips 1 number from the beguinning
  // replaySubject1.skipWhile((e)=>e == 1).listen(print); //2 will skip while condition is met
  // Observable.fromIterable([1,2,3,4,5]).interval(Duration(seconds: 1)).skipUntil(Observable.timer((i)=>i, Duration(seconds: 2))).listen(print); //2,3,4,5 will skip until condition stream emits a value

  // replaySubject1.delay(Duration(seconds: 1)).listen(print); //will emit events after certain amount of time


  // replaySubject1.throttle((e)=>Observable.just(true)).listen(print); // 1,2 emits first or last item (trailing) if [window] is open
  // replaySubject1.throttleTime(Duration(seconds: 5)).listen(print); // 1 emits the first/last item during a timespan

  // replaySubject1.debounce((e) => Stream.periodic(Duration(seconds: 2))).listen(print); //will only the last value after the window has completed (stream.periodic)
  // replaySubject1.debounceTime(Duration(seconds: 10)).listen(print); //emits the last event after time

  // replaySubject1.window(Observable.periodic(Duration(seconds: 1),(i)=>i)).flatMap((i)=>i).listen(print); //1,2 emits the original streams event every time the window emits an event
  // replaySubject1.windowTime(Duration(seconds: 1)).flatMap((i)=>i).listen(print); //1 2, emits each item after a duration
  // replaySubject1.windowCount(2).flatMap((i)=>i).listen(print); //groups n amount of events and turns them into a stream

  // replaySubject1.scan((acc, curr, i)=>{}).listen(print);
  
  // replaySubject1.timestamp().listen(print); //TimeStamp{timestamp: 2019-09-26 20:14:50.157418, value: 1}, TimeStamp{timestamp: 2019-09-26 20:14:50.160411, value: 2} wraps the values with a timestamp
    
  //All of these \/ are for mapping streams, map is for mapping their values, the rest is for mapping their values if they are a Observable
  // replaySubject1.map((e)=>e).listen(print); //1, 2 for each value in replaySubject, return the value.
  // replaySubject1.flatMap((e)=>Observable.timer(e, Duration(seconds: e))).listen(print); //1, 2 for each (map) value in replaySubject1, get the value and use it to create an Observable. When the observable returns, return its value.
  // replaySubject1.switchMap((e)=>Observable.timer(e, Duration(seconds: e))).listen(print); //2 for each (map) value in replaySubject1, get the value and use it to create an observable. Get the latest observable to return (most recent) and return its value.
  // replaySubject1.concatMap((e)=>Observable.just(e)).listen(print); //1,2 like flatMap but makes sure each value comes in the correct order by waiting for it to return before going to the next
  // replaySubject1.flatMapIterable((e)=>Observable.just([e,e])).listen(print);//1 1 2 2 like flatMap, but will return the value of each item of the observable
  // replaySubject1.mapTo(true).listen(print); //changes its value to whatever the parameter is
  // replaySubject1.asyncMap((e)=>Future.value(e)).listen(print); //returns the values of the futures of the stream (just like flatMap but for Future instead of Observable)
 
  // replaySubject1.expand((e)=>[e,e,e]).listen(print); //1,1,1,2,2,2 transforms an event into a array of events, then pushes each one of the elements in the array
 

}
