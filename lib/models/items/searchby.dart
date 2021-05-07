class SearchBy {
  final String? title;
  const SearchBy({this.title});
  static List<SearchBy> searchByList = [
    SearchBy(title: 'Categories'),
    SearchBy(title: 'Area'),
    SearchBy(title: 'Name'),
  ];
}
