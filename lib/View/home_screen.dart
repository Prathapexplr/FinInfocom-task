// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:fininfocom_task/Controller/number_controller.dart';
import 'package:fininfocom_task/Model/number_model.dart';

class NumberGridView extends StatefulWidget {
  const NumberGridView({super.key});

  @override
  _NumberGridViewState createState() => _NumberGridViewState();
}

class _NumberGridViewState extends State<NumberGridView> {
  final NumberController _controller = NumberController();
  final NumberModel _model = NumberModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _controller.selectedRule,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_alt_outlined),
            onPressed: () {
              _showRuleSelectionDialog();
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 10,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
          ),
          itemCount: 100,
          itemBuilder: (context, index) {
            int number = _model.numbers[index];
            return Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: _controller.shouldHighlight(number)
                    ? Colors.blue
                    : Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                number.toString(),
                style: TextStyle(
                  color: _controller.shouldHighlight(number)
                      ? Colors.white
                      : Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _showRuleSelectionDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select Highlight Rule'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: const Text('Odd Numbers'),
                onTap: () {
                  _updateRule('Odd Numbers');
                },
              ),
              ListTile(
                title: const Text('Even Numbers'),
                onTap: () {
                  _updateRule('Even Numbers');
                },
              ),
              ListTile(
                title: const Text('Prime Numbers'),
                onTap: () {
                  _updateRule('Prime Numbers');
                },
              ),
              ListTile(
                title: const Text('Fibonacci Numbers'),
                onTap: () {
                  _updateRule('Fibonacci Numbers');
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _updateRule(String newRule) {
    setState(() {
      _controller.setRule(newRule);
    });
    Navigator.pop(context);
  }
}
