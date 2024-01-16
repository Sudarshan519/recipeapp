Using Dart code `Home` to access this implementation:

```dart
final homeRepositoryProvider = Provider<homeRepository>((ref) {
  final datasource = ref.watch(homeDatasourceProvider(networkService));

  return homeRepositoryImpl(datasource);
});
```
