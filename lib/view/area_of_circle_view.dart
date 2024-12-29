import 'package:class_assignment_2/bloc/area_circle/area_of_circle_bloc.dart';
import 'package:class_assignment_2/bloc/area_circle/area_of_circle_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AreaCircleView extends StatelessWidget {
  const AreaCircleView({super.key});

  @override
  Widget build(BuildContext context) {
    // Access the AreaCircleBloc instance
    final areaCircleBloc = BlocProvider.of<AreaCircleBloc>(context);
    final TextEditingController radiusController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Area of circle'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // TextField for inputting radius
              TextField(
                controller: radiusController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter Radius',
                ),
              ),
              const SizedBox(height: 16),

              // BlocBuilder listens to state changes and updates the UI with the area
              BlocBuilder<AreaCircleBloc, double>(
                builder: (context, area) {
                  return Center(
                    child: Text(
                      'Area: ${area.toStringAsFixed(2)} sq. units',
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 24),

              // Button to trigger area calculation
              SizedBox(
                height: 48,
                child: ElevatedButton(
                  onPressed: () {
                    final radius =
                        double.tryParse(radiusController.text) ?? 0.0;
                    if (radius > 0) {
                   
                      areaCircleBloc.add(CalculateAreaEvent(radius));
                    } else {
                      // error message if radius is invalid
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please enter a valid radius!'),
                        ),
                      );
                    }
                  },
                  child: const Text('Calculate Area'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
