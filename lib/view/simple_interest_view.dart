import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/simple_interest/simple_interest_bloc.dart';

class SimpleInterestView extends StatefulWidget {
  const SimpleInterestView({super.key});

  @override
  State<SimpleInterestView> createState() => _SimpleInterestViewState();
}

class _SimpleInterestViewState extends State<SimpleInterestView> {
  double p = 0;
  double r = 0;
  double t = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Interest'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                onChanged: (value) {
                  setState(() {
                    p = double.tryParse(value) ?? 0;
                  });
                },
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Principal Amount',
                ),
              ),
              const SizedBox(height: 16),

              TextField(
                onChanged: (value) {
                  setState(() {
                    r = double.tryParse(value) ?? 0;
                  });
                },
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Rate of Interest (%)',
                ),
              ),
              const SizedBox(height: 16),

              TextField(
                onChanged: (value) {
                  setState(() {
                    t = double.tryParse(value) ?? 0;
                  });
                },
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Time in Year',
                ),
              ),
              const SizedBox(height: 16),

              // Interest Display Using BlocBuilder
              BlocBuilder<SimpleInterestBloc, double>(
                builder: (context, interest) {
                  return Center(
                    child: Text(
                      'Interest: Rs. ${interest.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  );
                },
              ),
              const SizedBox(height: 24),

              // Calculate Button
              SizedBox(
                height: 48,
                child: ElevatedButton(
                  onPressed: () {
                    // Dispatch the calculation directly using the emit method
                    context.read<SimpleInterestBloc>().calculateInterest(
                          p,
                          r,
                          t,
                        );
                  },
                  child: const Text('Calculate Interest'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
