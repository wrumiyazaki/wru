import 'package:flutter/material.dart';
import 'package:wru/ui/create_card/templates/input_items/input_items.dart';

class Template {
  late final Widget card;
  late final List<InputItem> inputItems;
  late final List<String> inputInitialValue;

  Template(this.card, this.inputItems, this.inputInitialValue);
}
