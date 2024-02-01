import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_garage/src/internal/infra/extensions/build_context_x.dart';
import 'package:my_garage/src/router.dart';

class GarageUpdateView extends StatefulWidget {
  const GarageUpdateView({super.key, required this.mileage});

  final int? mileage;

  @override
  State<StatefulWidget> createState() => _GarageUpdateViewState();
}

class _GarageUpdateViewState extends State<GarageUpdateView> {
  late final GlobalKey<FormState> _key;

  @override
  void initState() {
    super.initState();
    _key = GlobalKey();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.t.garageUpdateAppBarTitle),
        surfaceTintColor: Colors.transparent,
      ),
      body: Form(
        key: _key,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          children: [
            TextFormField(
              initialValue:
                  widget.mileage != null ? widget.mileage.toString() : '',
              autofocus: true,
              decoration: InputDecoration(
                labelText: context.t.garageUpdateMileageLabel,
              ),
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(7),
              ],
              keyboardType: TextInputType.number,
              onSaved: (mileage) => context.pop(int.tryParse(mileage ?? '')),
            ),
            SizedBox(
              height: context.data.padding.bottom +
                  kBottomNavigationBarHeight +
                  16.0,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FractionallySizedBox(
        widthFactor: 1.0,
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16.0,
            top: 0,
            right: 16.0,
            bottom: 16.0,
          ),
          child: FilledButton(
            onPressed: () => _key.currentState?.save(),
            style: FilledButton.styleFrom(
              padding: EdgeInsets.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            child: Text(context.t.garageUpdateSaveButton),
          ),
        ),
      ),
    );
  }
}
