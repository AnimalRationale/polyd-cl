import 'package:polymer/polymer.dart';
import 'model.dart' show Codelab;
import 'dart:html' show Event, Node;

@CustomTag('codelab-list')
class CodelabList extends PolymerElement {
   @observable List<Codelab> codelabs = toObservable([]);
   @observable Codelab newCodelab = new Codelab();
   String get defaultLevel => Codelab.LEVELS[1];

   CodelabList.created() : super.created() {
     newCodelab.level = defaultLevel;
   }
   resetForm() {
     newCodelab = new Codelab();
     newCodelab.level = defaultLevel;
   }

   addCodelab(Event e, var detail, Node sender) {
     e.preventDefault();
     codelabs.add(detail['codelab']);
     resetForm();
   }
}
