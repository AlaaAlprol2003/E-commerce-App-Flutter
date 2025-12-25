
class Meta {
  final int currentPage;
  final int numberOfPages;
  final int limit;

  Meta({
    required this.currentPage,
    required this.numberOfPages,
    required this.limit,
  });

  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(
      currentPage: json['currentPage'],
      numberOfPages: json['numberOfPages'],
      limit: json['limit'],
    );
  }
}
