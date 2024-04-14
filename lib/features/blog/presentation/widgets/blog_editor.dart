// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class BlogEditor extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final int? maxLine;
  const BlogEditor({
    super.key,
    required this.controller,
    required this.hintText,
    this.maxLine,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
      ),
      maxLines: maxLine,
      validator: (value) {
        // create a validator login if the value is empty return error
        if (value!.isEmpty) {
          return '$hintText is Missing';
        }
        return null;
      },
    );
  }
}
