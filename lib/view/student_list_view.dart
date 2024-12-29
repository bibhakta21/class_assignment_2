import 'package:class_assignment_2/bloc/student/student_list_bloc.dart';
import 'package:class_assignment_2/bloc/student/student_list_event.dart';
import 'package:class_assignment_2/bloc/student/student_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class StudentView extends StatelessWidget {
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Details'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Enter Name',border: OutlineInputBorder()),
              ),
              const SizedBox(height: 8),
              
              TextField(
                controller: _ageController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Enter Age', border: OutlineInputBorder(),),
              ),
              const SizedBox(height: 8),
              
              TextField(
                controller: _addressController,
                decoration: const InputDecoration(labelText: 'Enter Address',border: OutlineInputBorder()),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  final name = _nameController.text;
                  final age = int.tryParse(_ageController.text) ?? 0;
                  final address = _addressController.text;

                  if (name.isNotEmpty && age > 0 && address.isNotEmpty) {
                    context.read<StudentBloc>().add(AddStudent(name, age, address));
                    _nameController.clear();
                    _ageController.clear();
                    _addressController.clear();
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Please fill all fields')),
                    );
                  }
                },
                child: const Text('Submit'),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: BlocBuilder<StudentBloc, StudentState>(
                  builder: (context, state) {
                    if (state is StudentLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is StudentLoaded) {
                      final students = state.students;
                      if (students.isEmpty) {
                        return const Center(child: Text('No students added yet.'));
                      }
                      return ListView.builder(
                        itemCount: students.length,
                        itemBuilder: (context, index) {
                          final student = students[index];
                          return ListTile(
                            title: Text(student.name),
                            subtitle: Text('Age: ${student.age}\tAddress: ${student.address}'),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () {
                                context.read<StudentBloc>().add(DeleteStudent(index));
                              },
                            ),
                          );
                        },
                      );
                    } else if (state is StudentError) {
                      return Center(child: Text(state.message));
                    }
                    return const SizedBox.shrink();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
