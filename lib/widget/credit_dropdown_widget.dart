import 'package:flutter/material.dart';

import '../constant/project_constants.dart';
import '../helper/data_helper.dart';

class CreditDropDownWidget extends StatefulWidget {
  final Function onCreditSelected;
  const CreditDropDownWidget({super.key, required this.onCreditSelected});

  @override
  State<CreditDropDownWidget> createState() => _CreditDropDownWidgetState();
}

class _CreditDropDownWidgetState extends State<CreditDropDownWidget> {
  double? selectedCredit;

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
        value: selectedCredit ?? 1,
        items: DataHelper.allCreditItems(),
        underline: const SizedBox.shrink(),
        onChanged: (value) {
          setState(() {
            selectedCredit = value;
            widget.onCreditSelected(selectedCredit);
          });
        },
      ),
    );
  }
}
