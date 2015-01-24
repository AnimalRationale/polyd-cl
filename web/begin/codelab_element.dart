import 'package:polymer/polymer.dart';
import 'model.dart' show Codelab;
import 'dart:html' show Event, Node, CustomEvent;

@CustomTag('codelab-element')
class CodelabElement extends PolymerElement {
  @observable bool editing = false;
    Codelab _cachedCodelab;
    @published Codelab codelab;
  CodelabElement.created() : super.created() {}

  updateCodelab(Event e, var detail, Node sender) {
    e.preventDefault();
    editing = false;
  }

  startEditing(Event e, var detail, Node sender) {
    e.preventDefault();
    _cachedCodelab = new Codelab();
    copyCodelab(codelab, _cachedCodelab);
    editing = true;
  }

  cancelEditing(Event e, var detail, Node sender) {
    e.preventDefault();
    copyCodelab(_cachedCodelab, codelab);
    editing = false;
  }

  copyCodelab(source, destination) {
    destination.title = source.title;
    destination.description = source.description;
    destination.level = source.level;
  }

  deleteCodelab(Event e, var detail, Node sender) {
    e.preventDefault();
    dispatchEvent(new CustomEvent('deletecodelab',
        detail: {'codelab': codelab}));
  }
}
