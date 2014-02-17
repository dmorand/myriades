import 'dart:html';
//import 'package:polymer/polymer.dart';

void main() {
  HttpRequest.getString('../data/arenas.txt').then(onArenasLoaded);

  
  //initPolymer();
}

void onArenasLoaded(String responseText) {
  print(responseText);
}