class HomeModel {
  final String _id;
  final String _quote;

  HomeModel({
    required String id,
    required String quote
  }) : _id = id, _quote = quote;

  // Create getter for id
  String get id => _id;

  // Create getter for quote
  String get quote => _quote;
}