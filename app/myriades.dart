import 'dart:html';
import 'dart:js';
import 'package:chrome/chrome_app.dart' as chrome;

int boundsChange = 100;

/**
 * For non-trivial uses of the Chrome apps API, please see the
 * [chrome](http://pub.dartlang.org/packages/chrome).
 * 
 * * http://developer.chrome.com/apps/api_index.html
 */
void main() {
  querySelector("#sample_text_id")
    ..text = "Click me!"
    ..onClick.listen(doSomething);
}

void doSomething(MouseEvent event) {
  chrome.tts.speak("You clicked me you funny guy!");
}
