import 'package:flutter/material.dart';

class TopPageSearchWidget extends StatelessWidget {
  const TopPageSearchWidget({Key? key, this.onEditCompleted}) : super(key: key);
  final void Function(String keyword)? onEditCompleted;
  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search),
          hintText: 'Enter a recipe',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onEditingComplete: () {
          onEditCompleted!(controller.text);
          _hideKeyboard(context);
        },
      ),
    );
  }

  void _hideKeyboard(BuildContext context) {
    if (FocusScope.of(context).hasFocus) {
      FocusScope.of(context).unfocus();
    } else {
      FocusScope.of(context).requestFocus(FocusNode());
    }
  }
}
