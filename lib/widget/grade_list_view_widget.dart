import 'package:flutter/material.dart';
import 'package:grade_average_app/constant/project_constants.dart';
import 'package:grade_average_app/model/grade_model.dart';

class GradeListView extends StatelessWidget {
  final List<Grade> allGrades;
  final Function onDismiss;
  const GradeListView({super.key, required this.onDismiss, required this.allGrades});

  @override
  Widget build(BuildContext context) {
    return allGrades.isNotEmpty
        ? ListView.builder(
            itemCount: allGrades.length,
            itemBuilder: (context, index) {
              return Dismissible(
                key: UniqueKey(),
                direction: DismissDirection.startToEnd,
                onDismissed: (direction) {
                  onDismiss(index);
                },
                child: Padding(
                  padding: const EdgeInsets.all(2),
                  child: Card(
                    child: ListTile(
                      title: Text(allGrades[index].name),
                      subtitle: Text('Credit: ${allGrades[index].credit}, Note: ${allGrades[index].degree}'),
                      leading: CircleAvatar(
                        backgroundColor: ProjectConstants.primarySwatch,
                        child: Text((allGrades[index].degree * allGrades[index].credit).toStringAsFixed(0)),
                      ),
                    ),
                  ),
                ),
              );
            },
          )
        : Center(
            child: Text(
              'Please Add Grade',
              style: ProjectConstants.titleStyle,
            ),
          );
  }
}
