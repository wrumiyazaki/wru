import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wru/foundation/constants.dart';
import 'package:wru/ui/create_card/templates/cards/card_view_model.dart';
import 'package:wru/ui/theme/app_text_theme.dart';
import 'package:wru/ui/theme/app_theme.dart';

class NormalCardPage extends HookConsumerWidget {
  const NormalCardPage({required this.initialInformations, super.key});
  final List<String> initialInformations;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    final state = ref.watch(cardViewModelFamily(initialInformations));

    return AspectRatio(
      aspectRatio: Constants.cardAspectRatio,
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Card(
          color: theme.appColors.surface,
          shadowColor: theme.appColors.primary,
          elevation: 1,
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(state.informations[0], style: theme.textTheme.h30),
                    Text(state.informations[1], style: theme.textTheme.h30),
                  ],
                ),
                Row(
                  children: [
                    Text(state.informations[2], style: theme.textTheme.h30),
                    Text(state.informations[3], style: theme.textTheme.h30),
                    Text('年', style: theme.textTheme.h30),
                  ],
                ),
                const Expanded(
                  child: SizedBox(
                    height: double.infinity,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(state.informations[4],
                                  style: theme.textTheme.h50.bold()),
                              Text(state.informations[5],
                                  style: theme.textTheme.h10.dense()),
                            ],
                          )
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            state.informations[6],
                            style: theme.textTheme.h20.dense(),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
