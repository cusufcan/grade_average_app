import 'package:flutter/material.dart';

import '../constant/project_constants.dart';
import '../helper/data_helper.dart';

class DegreeDropDownWidget extends StatefulWidget {
  final Function onDegreeSelected;
  const DegreeDropDownWidget({super.key, required this.onDegreeSelected});

  @override
  State<DegreeDropDownWidget> createState() => _DegreeDropDownWidgetState();
}

class _DegreeDropDownWidgetState extends State<DegreeDropDownWidget> {
  double? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: ProjectConstants.dropdownPadding,
      decoration: BoxDecoration(
        color: ProjectConstants.primarySwatch.shade100.withOpacity(0.3),
        borderRadius: ProjectConstants.borderRadius,
      ),
      child: DropdownButton<double>(
        elevation: 16,
        iconEnabledColor: ProjectConstants.primarySwatch.shade200,
        value: selectedValue ?? 4.0,
        items: DataHelper.allGradeDegreeItems(),
        underline: const SizedBox.shrink(),
        onChanged: (value) {
          setState(() {
            selectedValue = value;
            widget.onDegreeSelected(selectedValue);
          });
        },
      ),
    );
  }
}
