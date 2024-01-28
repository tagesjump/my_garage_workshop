import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_garage/src/internal/infra/extensions/build_context_x.dart';

class GarageAddView extends StatefulWidget {
  const GarageAddView({
    super.key,
    required this.onBrandChanged,
    required this.onModelChanged,
    required this.onYearChanged,
    required this.onAdded,
  });

  final ValueChanged<String>? onBrandChanged;
  final ValueChanged<String>? onModelChanged;
  final ValueChanged<String>? onYearChanged;
  final VoidCallback? onAdded;

  @override
  State<StatefulWidget> createState() => _GarageAddViewState();
}

class _GarageAddViewState extends State<GarageAddView> {
  late final GlobalKey<FormState> _key;
  late AutovalidateMode _autoValidateMode;

  @override
  void initState() {
    super.initState();
    _key = GlobalKey();
    _autoValidateMode = AutovalidateMode.disabled;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.t.garageAddAppBarTitle)),
      body: Form(
        key: _key,
        autovalidateMode: _autoValidateMode,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          children: [
            TextFormField(
              decoration: InputDecoration(
                labelText: context.t.garageAddBrandLabel,
              ),
              validator: _emptyValidator,
              onChanged: widget.onBrandChanged,
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              decoration: InputDecoration(
                labelText: context.t.garageAddModelLabel,
              ),
              validator: _emptyValidator,
              onChanged: widget.onModelChanged,
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              decoration: InputDecoration(
                labelText: context.t.garageAddYearLabel,
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [LengthLimitingTextInputFormatter(4)],
              validator: _yearValidator,
              onChanged: widget.onYearChanged,
            ),
            SizedBox(
              height: context.data.padding.bottom +
                  kBottomNavigationBarHeight +
                  16.0,
            )
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
            onPressed: widget.onAdded != null ? _onAdded : null,
            style: FilledButton.styleFrom(
              padding: EdgeInsets.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            child: Text(context.t.garageAddButton),
          ),
        ),
      ),
    );
  }

  void _onAdded() {
    if (_key.currentState?.validate() ?? false) {
      widget.onAdded?.call();
    } else if (_autoValidateMode != AutovalidateMode.onUserInteraction) {
      setState(() => _autoValidateMode = AutovalidateMode.onUserInteraction);
    }
  }

  String? _emptyValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return context.t.garageAddEmptyError;
    }
    return null;
  }

  String? _yearValidator(String? value, {int min = 1950}) {
    final year = int.tryParse(value ?? '');
    if (year == null) return context.t.garageAddEmptyError;
    final nowYear = DateTime.now().year;
    if (year < min || year > nowYear) {
      return context.t.garageAddYearError(nowYear, min);
    }
    return null;
  }
}
