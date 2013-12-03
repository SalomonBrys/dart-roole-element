
library roole.element;

import 'dart:async';

import 'package:styleproc_element/element.dart';
import 'package:js/js.dart' as js;

class Roole {

  String get styleElementName => "roole";

  Future<String> compileStyleText(String txt, String classScope) {
    Completer<String> comp = new Completer<String>();
    js.context.roole.compile(".$classScope { $txt }", js.map({'base': './'}), (error, [css]) {
      if (error != null) {
        comp.completeError(error);
        return ;
      }
      if (css == null) {
        comp.completeError("Unknown Roole error");
        return ;
      }
      comp.complete(css);
    });
    return comp.future;
  }

}

class RooleElement extends StyleProcessorElement with Roole {
  RooleElement.created() : super.created() {}
}
