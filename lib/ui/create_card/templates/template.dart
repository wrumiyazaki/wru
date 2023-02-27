import 'package:flutter/material.dart';
import 'package:wru/ui/create_card/templates/cards/card_state.dart';
import 'package:wru/ui/create_card/templates/input_items/input_items.dart';

class Template {
  late final Widget card;
  late final CardState cardState;
  late final List<InputItem> inputItems;

  Template(this.card, this.cardState, this.inputItems);
}
