// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:dotted_border/dotted_border.dart';
import 'package:http_parser/http_parser.dart';

import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:image_picker/image_picker.dart';

class CustomImagePicker extends StatefulWidget {
  final String text;
  final Function onChanged;
  const CustomImagePicker({
    required this.text,
    required this.onChanged,
    Key? key,
  }) : super(key: key);

  @override
  State<CustomImagePicker> createState() => _CustomImagePickerState();
}

class _CustomImagePickerState extends State<CustomImagePicker> {
  late DropzoneViewController _controller;
  late String? _imageName;

  @override
  void initState() {
    _imageName = null;
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
                Expanded(
                  child: Center(
                    child: Text(
                      _imageName == null ? widget.text : _imageName!,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        TapRegion(
          onTapInside: (event) async => _pickImage(),
          child: SizedBox(
            height: 30,
            child: DropzoneView(
              operation: DragOperation.copy,
              cursor: CursorType.grab,
              onCreated: (ctrl) => _controller = ctrl,
              onLoaded: () => print('Zone, 1 loaded'),
              onError: (err) => print('Zone, 1 error: $err'),
              onDrop: (event) async {
                final bytes = await _controller.getFileData(event);

                final http.MultipartFile image = http.MultipartFile.fromBytes(
                  'image',
                  bytes,
                  filename: event.name,
                  contentType: MediaType(
                    '${event.type.substring(0, event.type.indexOf("/"))}',
                    '${event.type.substring(event.type.indexOf("/") + 1)}',
                  ),
                );

                widget.onChanged(image);

                setState(() {
                  _imageName = event.name;
                });
              },
              onDropInvalid: (err) => print('Zone 1 invalid MIME: $err'),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      final bytes = await pickedImage.readAsBytes();

      final http.MultipartFile image = http.MultipartFile.fromBytes(
        'image',
        bytes,
        filename: pickedImage.name,
        contentType: MediaType(
          '${pickedImage.mimeType?.substring(0, pickedImage.mimeType?.indexOf("/"))}',
          '${pickedImage.mimeType?.substring(pickedImage.mimeType!.indexOf("/") + 1)}',
        ),
      );

      widget.onChanged(image);

      setState(() {
        _imageName = pickedImage.name;
      });
    }
  }
}
