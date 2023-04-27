import 'package:bitcamp/data/Property.dart';

/*
RecProperty stands for the reccomended property. It is the data type 
for recommended property. It extends the class Property, since they possess all
the features of a regular Property, but have additional features (to store
the analysis of the recommended property such as break even point and 
percentage increment)

*/
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
