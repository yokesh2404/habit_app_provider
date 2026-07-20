import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:habit_tracker/src/core/utils/app_colors.dart';
import 'package:habit_tracker/src/core/utils/app_extensions.dart';
import 'package:habit_tracker/src/features/new_task/presentation/controller/new_task_provider.dart';
import 'package:provider/provider.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _taskNameController = TextEditingController();
  TextEditingController _durationController = TextEditingController();

  late NewTaskProvider baseProvider;
  @override
  void initState() {
    super.initState();
    baseProvider = context.read<NewTaskProvider>();

    _durationController.text = baseProvider.state.duration.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<NewTaskProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: true,
            backgroundColor: AppColors.appbar,
            title: Text(
              "New Task",
              style: TextStyle(
                color: AppColors.primary,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),

          body: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(12),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Task Name",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 12),
                        TextFormField(
                          controller: _taskNameController,
                          decoration: InputDecoration(
                            hint: Text("Enter your task"),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 1,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter valid name";
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 12),
                        Text(
                          "Duration",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 12),
                        TextFormField(
                          controller: _durationController,
                          keyboardType: TextInputType.numberWithOptions(),
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          decoration: InputDecoration(
                            hint: Text("Challenge duration"),

                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 1,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              provider.changeDuration(value);
                            }
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter valid duration";
                            } else if (value.isNotEmpty &&
                                !RegExp(r'^\d+$').hasMatch(value)) {
                              return "Enter only numbers";
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 12),
                        Text(
                          "Start date",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 12),
                        GestureDetector(
                          onTap: () async {
                            var pickedDate = await showDatePicker(
                              context: context,
                              firstDate: DateTime.now(),
                              lastDate: DateTime.now().add(Duration(days: 365)),
                            );
                            if (pickedDate != null) {
                              provider.modifyStartDate(
                                pickedDate,
                                int.parse(_durationController.text),
                              );
                            }
                          },
                          child: Container(
                            height: 60,
                            width: context.screenWidth,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: EdgeInsets.all(12),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              provider.state.startDate!.toFormatDate(
                                "dd/MMM/yy",
                              ),
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 12),
                        Text(
                          "End date",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 12),
                        Container(
                          height: 60,
                          width: context.screenWidth,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: EdgeInsets.all(12),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            provider.state.endDate!.toFormatDate("dd/MMM/yy"),
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(24),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {}
                  },
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(AppColors.primary),
                    fixedSize: WidgetStatePropertyAll(
                      Size(context.screenWidth, 60),
                    ),
                  ),
                  child: Text(
                    "Submit",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _durationController.dispose();
    _taskNameController.dispose();
  }
}
