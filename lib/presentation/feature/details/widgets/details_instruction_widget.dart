
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RecipeInstructionWidget extends ConsumerWidget {
  const RecipeInstructionWidget({
    required this.instruction,
    Key? key,
  }) : super(key: key);
  final String instruction;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blueGrey, width: 1),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          children: [
            const Text(
              'Instruction',
              style: TextStyle(color: Colors.orangeAccent, fontSize: 16),
            ),
            const Divider(
              color: Colors.grey,
              height: 1,
              thickness: 1,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(instruction),
            )
          ],
        ),
      ),
    );
  }
}
