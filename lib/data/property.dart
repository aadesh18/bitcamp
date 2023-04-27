/*
Property Class is the data type for each property on the app. It has various 
necessary fields essential for a property, such as the price, location, size,
etc. 
*/

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
