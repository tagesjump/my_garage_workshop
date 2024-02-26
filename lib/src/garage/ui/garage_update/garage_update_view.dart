import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_garage/src/garage/infra/models/auto.dart';
import 'package:my_garage/src/internal/infra/extensions/build_context_x.dart';
import 'package:my_garage/src/router.dart';

class GarageUpdateView extends StatefulWidget {
  const GarageUpdateView({super.key, required this.auto});

  final Auto auto;

  @override
  State<StatefulWidget> createState() => _GarageUpdateViewState();
}

class _GarageUpdateViewState extends State<GarageUpdateView> {
  late final GlobalKey<FormState> _key;
  late Auto _auto;

  @override
  void initState() {
    super.initState();
    _key = GlobalKey();
    _auto = widget.auto;
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
              initialValue: widget.auto.mileage != null
                  ? widget.auto.mileage.toString()
                  : '',
              autofocus: true,
              decoration: InputDecoration(
                labelText: context.t.garageUpdateMileageLabel,
              ),
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(7),
              ],
              keyboardType: TextInputType.number,
              onSaved: (mileage) =>
                  _auto = _auto.copyWith(mileage: int.tryParse(mileage ?? '')),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              initialValue: widget.auto.bodyNumber,
              decoration: InputDecoration(
                labelText: context.t.garageUpdateBodyNumberLabel,
              ),
              onSaved: (bodyNumber) =>
                  _auto = _auto.copyWith(bodyNumber: bodyNumber),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              initialValue: widget.auto.chassisNumber,
              decoration: InputDecoration(
                labelText: context.t.garageUpdateChassisNumberLabel,
              ),
              onSaved: (chassisNumber) =>
                  _auto = _auto.copyWith(chassisNumber: chassisNumber),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              initialValue: widget.auto.vin,
              decoration: InputDecoration(
                labelText: context.t.garageUpdateVinLabel,
              ),
              onSaved: (vin) => _auto = _auto.copyWith(vin: vin),
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
            onPressed: () {
              _key.currentState?.save();
              return context.pop(_auto);
            },
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
