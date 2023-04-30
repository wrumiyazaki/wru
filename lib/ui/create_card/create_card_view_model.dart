import 'dart:ffi';
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wru/ui/create_card/create_card_state.dart';
import 'package:wru/ui/create_card/templates/cards/normal_card_page.dart';
import 'package:wru/ui/create_card/templates/cards/test_card_page.dart';
import 'package:wru/ui/create_card/templates/input_items/input_items.dart';
import 'package:wru/ui/create_card/templates/template.dart';

final createCardViewModelProvider =
    StateNotifierProvider<CreateCardViewModel, CreateCardState>(
  (ref) => CreateCardViewModel(),
);

class CreateCardViewModel extends StateNotifier<CreateCardState> {
  CreateCardViewModel() : super(const CreateCardState()) {
    load();
  }

  void load() {
    final normalTemplate = Template(
      NormalCardPage(initialValue: InputItemsTemplate.normalInputInitialValue),
      InputItemsTemplate.normalInputItems,
      InputItemsTemplate.normalInputInitialValue,
    );

    final testTemplate = Template(
      TestCardPage(initialValue: InputItemsTemplate.testInputInitialValue),
      InputItemsTemplate.testInputItems,
      InputItemsTemplate.testInputInitialValue,
    );

    //選択するテンプレートを並べる
    state = state.copyWith(
      templates: [
        normalTemplate,
        // testTemplate,
        // normalTemplate,
        // testTemplate,
        // normalTemplate,
        // testTemplate,
        // normalTemplate,
        // testTemplate,
      ],
      enteredInformations: [],
    );
  }

  void selectTemplate(int idx) {
    state = state.copyWith(
      selectedTemplate: state.templates[idx],
      enteredInformations: state.templates[idx].inputInitialValue,
    );
  }

  void updateInformation(int idx, String value) {
    var informations = [...state.enteredInformations];
    informations[idx] = value;
    state = state.copyWith(enteredInformations: informations);
  }

  //入力された情報をもとフィールドをfirebaseに保存
  //つくった名刺の画像を保存
  void listToMapMyInformation() {
    //この関数をrepositrotyで呼ぶ
    state.enteredInformations;
    state.selectedTemplate!.inputItems[1].label;
    Map map;
    for (int i = 0; i < state.selectedTemplate!.inputItems.length; i++) {
      map = {
        state.selectedTemplate!.inputItems[i].label:
            state.enteredInformations[i]
      };
    }
  }

  Future<Uint8List?> widgetToImage(globalKey) async {
    Uint8List? bytes;
    final boundary =
        globalKey.currentContext.findRenderObject() as RenderRepaintBoundary?;
    if (boundary == null) {
      return null;
    }
    final image = await boundary.toImage();
    final byteData = await image.toByteData(format: ImageByteFormat.png);
    bytes = byteData?.buffer.asUint8List();
    if (bytes != null) {
      print('nulじゃないよ');
      return bytes;
    }
    print('nullです');
    return null;
  }
}
