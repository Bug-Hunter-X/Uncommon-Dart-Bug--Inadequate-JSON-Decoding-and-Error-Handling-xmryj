```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      // Incorrect handling of JSON response.  Assumes a top-level map.
      final jsonData = jsonDecode(response.body) as Map<String, dynamic>;
      // ... further processing of jsonData ...
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    print('Error: $e'); // Basic error handling - insufficient detail
  }
}
```