import 'package:final_project/provider/TasksProvider/add_task_provider.dart';
import 'package:final_project/utils/snack_message.dart';
import 'package:final_project/widgets/button.dart';
import 'package:final_project/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreatTask extends StatefulWidget {
  const CreatTask({Key? key}) : super(key: key);
  @override
  State<CreatTask> createState() => _CreatTaskState();
}
class _CreatTaskState extends State<CreatTask> {
  final TextEditingController _title = TextEditingController();
  @override
  void dispose() {
    _title.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create Task')),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  customTextField(
                    title: 'Title',
                    controller: _title,
                    hint: 'What do you want to do?',
                  ),
                  Consumer<AddTaskProvider>(builder: (context, addTask, child) {
                    WidgetsBinding.instance!.addPostFrameCallback((_) {
                      if (addTask.getResponse != '') {
                        showMessage(
                            message: addTask.getResponse, context: context);

                        ///Clear the response message to avoid duplicate
                        addTask.clear();
                      }
                    });
                    return customButton(
                      status: addTask.getStatus,
                      tap: () {
                        if (_title.text.isEmpty) {
                          showMessage(
                              message: "Fill in title", context: context);
                        } else {
                          addTask.addTask(title: _title.text.trim());
                        }
                      },
                      context: context,
                    );
                  })
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
