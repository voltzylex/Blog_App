import 'dart:io';

import 'package:blog_app/core/common/utils/pick_image.dart';
import 'package:blog_app/core/theme/app_pallete.dart';
import 'package:blog_app/features/blog/presentation/widgets/blog_editor.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class AddNewBlogPage extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (context) => const AddNewBlogPage());
  const AddNewBlogPage({super.key});

  @override
  State<AddNewBlogPage> createState() => _AddNewBlogPageState();
}

class _AddNewBlogPageState extends State<AddNewBlogPage> {
  final TextEditingController blogTitle = TextEditingController();
  final TextEditingController blogContent = TextEditingController();
  List<String> selectedTopics = [];
  File? image;
  selectImage() async {
    image = await pickImage();
    if (image != null) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    blogTitle.dispose();
    blogContent.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.done_rounded),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            InkWell(
              onTap: selectImage,
              child: image != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: SizedBox(
                        height: 150,
                        width: double.infinity,
                        child: Image.file(
                          image!,
                          fit: BoxFit.contain,
                        ),
                      ),
                    )
                  : DottedBorder(
                      color: AppPallete.borderColor,
                      dashPattern: const [10, 4],
                      radius: const Radius.circular(10),
                      borderType: BorderType.RRect,
                      strokeCap: StrokeCap.round,
                      child: const SizedBox(
                          height: 150,
                          width: double.infinity,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.folder_open_rounded,
                                size: 50,
                              ),
                              Text(
                                'Select Your Image',
                                style: TextStyle(),
                              ),
                            ],
                          )),
                    ),
            ),
            const SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: ["Technology", "Business", "Programming", "Entertainment"]
                    .map(
                      (e) => Padding(
                        padding: const EdgeInsets.all(5),
                        child: GestureDetector(
                          onTap: () {
                            if (selectedTopics.contains(e)) {
                              selectedTopics.remove(e);
                            } else {
                              selectedTopics.add(e);
                            }
                            setState(() {});
                          },
                          child: Chip(
                            label: Text(e),
                            autofocus: true,
                            color: selectedTopics.contains(e)
                                ? const MaterialStatePropertyAll(AppPallete.gradient1)
                                : null,
                            side: selectedTopics.contains(e)
                                ? BorderSide.none
                                : const BorderSide(color: AppPallete.borderColor),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
            BlogEditor(controller: blogTitle, maxLine: 1, hintText: "Blog Title"),
            const SizedBox(height: 10),
            BlogEditor(controller: blogContent, hintText: "Blog Content"),
          ],
        ),
      ),
    );
  }
}
