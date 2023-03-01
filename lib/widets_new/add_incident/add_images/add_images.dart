import 'dart:async';
import 'dart:io';

import 'package:Field_Monitoring/stores/language/language_store.dart';
import 'package:Field_Monitoring/ui/constants/colors.dart';
import 'package:Field_Monitoring/widets_new/add_incident/preview_incident_image/preview_incident_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

import '../../../constants/images.dart';

class AddImagesScreen extends StatefulWidget {
  final LanguageStore languageStore;
  final double? imageMaxWidth;
  final double? imageMaxHeight;
  final int? imageQuality;
  final ValueChanged<List<XFile>> onImageListChanged;

  const AddImagesScreen(
      {Key? key,
      required this.languageStore,
      this.imageMaxWidth,
      this.imageMaxHeight,
      this.imageQuality,
      required this.onImageListChanged})
      : super(key: key);

  @override
  State<AddImagesScreen> createState() => _AddImagesScreenState();
}

class _AddImagesScreenState extends State<AddImagesScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        _imageFileList!.length > 0
            ? Column(
                children: _imageFileList!
                    .map((image) => PreviewIncidentImage(
                          image,
                          languageStore: widget.languageStore,
                        ))
                    .toList(),
              )
            : Container(
          height: MediaQuery.of(context).size.height * 0.5,
              child: Column(
          mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    SvgPicture.asset(
                      addIncidentFolderOpen,
                      alignment: Alignment.center,

                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                          widget.languageStore.language.noIncidentImages,
                          style: TextStyle(color: Colors.grey)),
                    )
                  ],
                ),
            ),
        Spacer(),
        Align(
          alignment: FractionalOffset.bottomCenter,
          child: Container(
            child: IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Spacer(),
                  InkWell(
                      onTap: () => _onImageButtonPressed(ImageSource.gallery),
                      child: Row(
                        children: [
                          Icon(
                            Icons.file_upload_outlined,
                            size: 40,
                            color: CustomColor.lightGreenColor,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            widget.languageStore.language.uploadImage,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(color: Colors.black),
                          ),
                        ],
                      )),
                  Spacer(),
                  VerticalDivider(),
                  Spacer(),
                  InkWell(
                      onTap: () => _onImageButtonPressed(ImageSource.camera),
                      child: Row(
                        children: [
                          Icon(
                            Icons.camera_alt_outlined,
                            size: 40,
                            color: CustomColor.lightGreenColor,
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Text(
                            widget.languageStore.language.pickUpImage,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(color: Colors.black),
                          ),
                        ],
                      )),
                  Spacer(),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  final ImagePicker _picker = ImagePicker();
  VideoPlayerController? _controller;
  VideoPlayerController? _toBeDisposed;
  bool isVideo = false;
  List<XFile>? _imageFileList = [];
  dynamic _pickImageError;
  StreamController<List<XFile>> streamController =
      StreamController<List<XFile>>();

  Future<void> _disposeVideoController() async {
    if (_toBeDisposed != null) {
      await _toBeDisposed!.dispose();
    }
    _toBeDisposed = _controller;
    _controller = null;
  }

  Future<void> _playVideo(XFile? file) async {
    if (file != null && mounted) {
      await _disposeVideoController();
      late VideoPlayerController controller;
      if (kIsWeb) {
        controller = VideoPlayerController.network(file.path);
      } else {
        controller = VideoPlayerController.file(File(file.path));
      }
      _controller = controller;
      // In web, most browsers won't honor a programmatic call to .play
      // if the video has a sound track (and is not muted).
      // Mute the video so it auto-plays in web!
      // This is not needed if the call to .play is the result of user
      // interaction (clicking on a "play" button, for example).
      const double volume = kIsWeb ? 0.0 : 1.0;
      await controller.setVolume(volume);
      await controller.initialize();
      await controller.setLooping(true);
      await controller.play();
      setState(() {});
    }
  }

  Future<void> _onImageButtonPressed(ImageSource source,
      {bool isMultiImage = false}) async {
    if (_controller != null) {
      await _controller!.setVolume(0.0);
    }
    if (isVideo) {
      final XFile? file = await _picker.pickVideo(
          source: source, maxDuration: const Duration(seconds: 10));
      await _playVideo(file);
    } else if (isMultiImage) {
      try {
        final List<XFile>? pickedFileList = await _picker.pickMultiImage(
          maxWidth: widget.imageMaxWidth, //,
          maxHeight: widget.imageMaxHeight, //maxHeight,
          imageQuality: widget.imageQuality, //quality,
        );
        setState(() {
          _imageFileList = _imageFileList ?? <XFile>[];
          _imageFileList!.addAll(pickedFileList ?? <XFile>[]);
          _onImageListChanged();
        });
      } catch (e) {
        setState(() {
          _pickImageError = e;
        });
      }
    } else {
      try {
        final XFile? pickedFile = await _picker.pickImage(
          source: source,
          maxWidth: widget.imageMaxWidth, //maxWidth,
          maxHeight: widget.imageMaxHeight, //maxHeight,
          imageQuality: widget.imageQuality, //quality,
        );
        setState(() {
          _setImageFileListFromFile(pickedFile);
        });
      } catch (e) {
        setState(() {
          _pickImageError = e;
        });
      }
    }
  }

  void _setImageFileListFromFile(XFile? value) {
    _imageFileList = _imageFileList ?? <XFile>[];
    if (value != null) {
      _imageFileList!.add(value);
    }
    _onImageListChanged();
    // _imageFileList = value == null ? null : <XFile>[value];
  }

  void _onImageListChanged() {
    widget.onImageListChanged(_imageFileList ?? <XFile>[]);
    streamController.add(_imageFileList ?? <XFile>[]);
  }
}
