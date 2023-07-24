import 'package:flutter/material.dart';

import '../constant/project_constants.dart';

class TextFormFieldWidget extends StatefulWidget {
  final Function onSaved;
  const TextFormFieldWidget({super.key, required this.onSaved});

  @override
  State<TextFormFieldWidget> createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  String? selectedGradeName;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: (newValue) {
        setState(() {
          selectedGradeName = newValue;
          widget.onSaved(selectedGradeName);
        });
      },
      validator: (value) {
        return value!.isEmpty ? 'Error!' : null;
      },
      decoration: InputDecoration(
        hintText: 'Math',
        border: OutlineInputBorder(
          borderRadius: ProjectConstants.borderRadius,
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: ProjectConstants.primarySwatch.shade100.withOpacity(0.3),
      ),
    );
  }
}
