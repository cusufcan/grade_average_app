import 'package:flutter/material.dart';
import 'package:grade_average_app/constant/project_constants.dart';
import 'package:grade_average_app/helper/data_helper.dart';
import 'package:grade_average_app/model/grade_model.dart';
import 'package:grade_average_app/widget/credit_dropdown_widget.dart';
import 'package:grade_average_app/widget/degree_dropdown_widget.dart';
import 'package:grade_average_app/widget/grade_list_view_widget.dart';
import 'package:grade_average_app/widget/show_average_widget.dart';
import 'package:grade_average_app/widget/text_form_field_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  double? selectedValue;
  double? selectedCredit;
  String? selectedGradeName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Center(child: Text(ProjectConstants.appName, style: ProjectConstants.titleStyle)),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(flex: 2, child: _buildForm()),
              Expanded(
                flex: 1,
                child: ShowAverageWidget(
                  average: DataHelper.calculateAverage(),
                  gradeCount: DataHelper.allAddedGrades.length,
                ),
              ),
            ],
          ),
          Expanded(
              child: GradeListView(
            allGrades: DataHelper.allAddedGrades,
            onDismiss: (index) {
              DataHelper.allAddedGrades.removeAt(index);
              setState(() {});
            },
          )),
        ],
      ),
    );
  }

  Widget _buildForm() {
    return Form(
        key: formKey,
        child: Column(
          children: [
            Padding(
              padding: ProjectConstants.horizontalPaddingNormal,
              child: TextFormFieldWidget(
                onSaved: (selectedGradeName) {
                  this.selectedGradeName = selectedGradeName;
                },
              ),
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Padding(
                    padding: ProjectConstants.horizontalPaddingNormal,
                    child: DegreeDropDownWidget(
                      onDegreeSelected: (selectedDegree) {
                        selectedValue = selectedDegree;
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: ProjectConstants.horizontalPaddingNormal,
                    child: CreditDropDownWidget(
                      onCreditSelected: (selectedCredit) {
                        this.selectedCredit = selectedCredit;
                      },
                    ),
                  ),
                ),
                IconButton(
                  onPressed: _addGradeAndCalculateAverage,
                  icon: const Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: ProjectConstants.primarySwatch,
                    size: 30,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
          ],
        ));
  }

  void _addGradeAndCalculateAverage() {
    if (formKey.currentState!.validate()) {
      formKey.currentState?.save();
      var tempGrade = Grade(selectedGradeName ?? 'null', selectedValue ?? 4, selectedCredit ?? 1);
      DataHelper.addGrade(tempGrade);
      setState(() {});
    }
  }
}
