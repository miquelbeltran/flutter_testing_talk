import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as Http;

void main() {
  test('network call', () async {
    String url = 'http://example.com/api/items/1';
    Http.Response response = await Http.get(url);
    expect(response.statusCode, 404);
  },skip: 'Skip this');
}
