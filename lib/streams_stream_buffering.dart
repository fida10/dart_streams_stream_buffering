/// Support for doing something awesome.
///
/// More dartdocs go here.
library;

export 'src/streams_stream_buffering_base.dart';

/*
Practice Question 3: Stream Buffering

Task:

Implement a function bufferStream that takes a Stream<int> 
and an integer bufferSize. The function should return a Stream<List<int>> 
where each emitted list contains up to bufferSize elements from the input stream.
 */

bufferStream(Stream<int> input, int bufferSize) async* {
  List<int> indivList = [];
  int chunkCounter = 0;
  
  await for (var indivChunk in input) {
    indivList.add(indivChunk);
    chunkCounter++;
    if (chunkCounter == bufferSize) {
      chunkCounter = 0;
      yield indivList;
      indivList = [];
    }
  }

  if (indivList.isNotEmpty) {
    yield indivList;
  }
}