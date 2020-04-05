import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:sorting/styles.dart';

class SortValues extends StatefulWidget {
  SortValues({
    this.initialValue,
    this.onChanged,
    this.text,
  });

  final int initialValue;
  final Function onChanged;
  final String text;

  @override
  _SortValuesState createState() => _SortValuesState();
}

class _SortValuesState extends State<SortValues> {
  int firstValue;

  void _showDialog() {
    showDialog<int>(
      context: context,
      builder: (context) {
        return NumberPickerDialog.integer(
          title: Text('Choose', style: TextStyles.title),
          minValue: 1,
          maxValue: 1000,
          initialIntegerValue: widget.initialValue,
        );
      },
    ).then((value) {
      if (value != null) {
        setState(() => firstValue = value);
        widget.onChanged.call(value);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    firstValue = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () => _showDialog(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            widget.text,
            style: TextStyles.body,
          ),
        ),
      ),
    );
  }
}
