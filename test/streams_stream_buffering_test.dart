import 'package:streams_stream_buffering/streams_stream_buffering.dart';
import 'package:test/test.dart';

void main() {
  test('bufferStream buffers elements into lists of given size', () async {
    var input = Stream.fromIterable([1, 2, 3, 4, 5, 6, 7]);
    var buffered = bufferStream(input, 3);
    var expected = [
      [1, 2, 3],
      [4, 5, 6],
      [7] // Last list can be smaller than buffer size
    ];
    expect(await buffered.toList(), equals(expected));
  });

  test('bufferStream handles an empty stream', () async {
    var input = Stream<int>.empty();
    var buffered = bufferStream(input, 3);
    expect(await buffered.toList(), isEmpty);
  });
}
