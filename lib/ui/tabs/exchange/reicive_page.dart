import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:wru/ui/routes/app_route.gr.dart';

class RecievePage extends StatelessWidget {
  const RecievePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: TextButton(
        onPressed: () {
          context.router.push(TabRoute());
        },
        child: Text('ホームへ'),
      ),
    );
  }
}
