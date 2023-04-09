class Property {
  final String id;
  final String img;
  final String price;
  final String bed;
  final String bath;
  final String sqft;
  final String location;

  Property(
      {required this.id,
      required this.img,
      required this.price,
      required this.bed,
      required this.bath,
      required this.sqft,
      required this.location});
}

class RecProperty extends Property {
  final String breakEven;
  final String perInc;
  final String rent;
  RecProperty(
      {required this.breakEven,
      required this.perInc,
      required this.rent,
      required super.id,
      required super.img,
      required super.price,
      required super.bed,
      required super.bath,
      required super.sqft,
      required super.location});
}
