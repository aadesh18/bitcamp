// importing the necessary packages
import 'package:http/http.dart' as http;
import 'dart:convert';

/*
User Class is the data type for how each user will be store. 
Each user has two properties - name and amount of money store in
the bank account.
*/

class User {
  final String name;
  final int amount;
  User({required this.name, required this.amount});
}
