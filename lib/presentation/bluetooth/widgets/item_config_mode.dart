class Item {
  Item({
    required this.expandedValueEco,
    required this.expandedValueSport,
    required this.headerValue,
    this.isExpanded = false,
  });

  String expandedValueEco;
  String expandedValueSport;
  String headerValue;
  bool isExpanded;
}

List<Item> generateItems(int numberOfItems) {
  return List.generate(numberOfItems, (int index) {
    return Item(
      headerValue: 'Config Mode',
      expandedValueEco: 'ECO',
      expandedValueSport: 'Sport',
    );
  });
}
