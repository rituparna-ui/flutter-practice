import 'dart:io';

import 'package:http/http.dart' as http;
import 'dart:convert' as cov;

void main() {
  getMethod();
}

getMethod() async {
  http.get('http://api.rituparnawarwatkar.com/api').then((value) => print(value.body));
  
}
