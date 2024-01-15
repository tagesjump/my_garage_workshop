import 'package:my_garage/src/internal/infra/extensions/build_context_x.dart';
import 'package:flutter/material.dart';

class GarageAddView extends StatelessWidget {
  const GarageAddView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.t.garageAddAppBarTitle)),
    );
  }
}
