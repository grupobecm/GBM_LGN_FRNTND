import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';

import 'package:flutter_dropzone/flutter_dropzone.dart';

class CustomImagePicker extends StatefulWidget {
  final String text;
  const CustomImagePicker({
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  State<CustomImagePicker> createState() => _CustomImagePickerState();
}

class _CustomImagePickerState extends State<CustomImagePicker> {
  late DropzoneViewController controller;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        DottedBorder(
          borderType: BorderType.RRect,
          strokeWidth: 1,
          color: Theme.of(context).colorScheme.secondary,
          radius: const Radius.circular(5),
          dashPattern: const [8, 2],
          child: SizedBox(
            height: 30,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.file_upload_outlined),
                Text(widget.text),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 30,
          child: DropzoneView(
            operation: DragOperation.copy,
            cursor: CursorType.grab,
            onCreated: (ctrl) => controller = ctrl,
            onLoaded: () => print('Zone, 1 loaded'),
            onError: (err) => print('Zone, 1 error: $err'),
            onDrop: (event) async {
              final name = event.name;

              controller.getFileData(event);

              print(name);
              print(event.type);
            },
            onDropInvalid: (err) => print('Zone 1 invalid MIME: $err'),
          ),
        ),
      ],
    );
  }
}
