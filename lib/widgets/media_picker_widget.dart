// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// ignore_for_file: public_member_api_docs

import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

import '../stores/language/language_store.dart';
import '../utils/locale/app_localization.dart';

class MediaPickerWidget extends StatefulWidget {
  Function(List<XFile>) onImageListChanged;
  bool hidePickSingleImageFromGallery;

  bool hidePickMulipleImageFromGallery;

  bool hideTakeImageByCamera;

  bool hidePickSingleVideoFromGallery;

  bool hideTakeVideo;

  List<XFile>? initialImageList;

  double? imageMaxWidth;
  double? imageMaxHeight;
  int? imageQuality;

  // bool showSelectedImage;
  // bool showSelectedVideo;

  MediaPickerWidget(
      {Key? key,
      this.title = '',
      required this.onImageListChanged,
      this.hidePickSingleImageFromGallery = false,
      this.hidePickMulipleImageFromGallery = false,
      this.hideTakeImageByCamera = false,
      this.hidePickSingleVideoFromGallery = false,
      this.hideTakeVideo = false,
      this.initialImageList,
      this.imageMaxWidth,
      this.imageMaxHeight,
      this.imageQuality
      // this.showSelectedImage = true,
      // this.showSelectedVideo = true,
      })
      : super(key: key);

  final String? title;

  @override
  State<MediaPickerWidget> createState() => _MediaPickerWidgetState();
}

class _MediaPickerWidgetState extends State<MediaPickerWidget> {
  List<XFile>? _imageFileList;
late LanguageStore _languageStore;
  void _onImageListChanged() {
    widget.onImageListChanged(_imageFileList ?? <XFile>[]);
    streamController.add(_imageFileList ?? <XFile>[]);
  }

  void _setImageFileListFromFile(XFile? value) {
    _imageFileList = _imageFileList ?? <XFile>[];
    if (value != null) {
      _imageFileList!.add(value);
    }
    _onImageListChanged();
    // _imageFileList = value == null ? null : <XFile>[value];
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  _languageStore =Provider.of<LanguageStore>(context);

  }

  dynamic _pickImageError;
  bool isVideo = false;

  VideoPlayerController? _controller;
  VideoPlayerController? _toBeDisposed;
  String? _retrieveDataError;

  final ImagePicker _picker = ImagePicker();
  final TextEditingController maxWidthController = TextEditingController();
  final TextEditingController maxHeightController = TextEditingController();
  final TextEditingController qualityController = TextEditingController();

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
      {BuildContext? context, bool isMultiImage = false}) async {
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
      // await _displayPickImageDialog(context!,
      //     (double? maxWidth, double? maxHeight, int? quality) async {
      //   try {
      //     final List<XFile>? pickedFileList = await _picker.pickMultiImage(
      //       maxWidth: maxWidth,
      //       maxHeight: maxHeight,
      //       imageQuality: quality,
      //     );
      //     setState(() {
      //       _imageFileList = pickedFileList;
      //     });
      //   } catch (e) {
      //     setState(() {
      //       _pickImageError = e;
      //     });
      //   }
      // });
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
      // await _displayPickImageDialog(context!,
      //     (double? maxWidth, double? maxHeight, int? quality) async {
      //   try {
      //     final XFile? pickedFile = await _picker.pickImage(
      //       source: source,
      //       maxWidth: maxWidth,
      //       maxHeight: maxHeight,
      //       imageQuality: quality,
      //     );
      //     setState(() {
      //       _setImageFileListFromFile(pickedFile);
      //     });
      //   } catch (e) {
      //     setState(() {
      //       _pickImageError = e;
      //     });
      //   }
      // });
    }
  }

  @override
  void deactivate() {
    if (_controller != null) {
      _controller!.setVolume(0.0);
      _controller!.pause();
    }
    super.deactivate();
  }

  @override
  void dispose() {
    _disposeVideoController();
    maxWidthController.dispose();
    maxHeightController.dispose();
    qualityController.dispose();
    super.dispose();
  }

  Future<void> _disposeVideoController() async {
    if (_toBeDisposed != null) {
      await _toBeDisposed!.dispose();
    }
    _toBeDisposed = _controller;
    _controller = null;
  }

  Widget _previewVideo() {
    final Text? retrieveError = _getRetrieveErrorWidget();
    if (retrieveError != null) {
      return retrieveError;
    }
    if (_controller == null) {
      return const Text(
        'You have not yet picked a video',
        textAlign: TextAlign.center,
      );
    }
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: AspectRatioVideo(_controller),
    );
  }

  StreamController<List<XFile>> streamController =
      StreamController<List<XFile>>();

  Widget _previewImages() {
    final Text? retrieveError = _getRetrieveErrorWidget();
    if (retrieveError != null) {
      return retrieveError;
    }
    debugPrint("_imageFileList ${_imageFileList==null}");
    if (_imageFileList != null) {
      streamController = StreamController<List<XFile>>();
      streamController.add(_imageFileList!);
      return StreamBuilder<List<XFile>>(
        builder: (context, snaphsot) {
          return Container(
            width: 250,
            child: Semantics(
              label: 'image_picker_example_picked_images',
              child: ListView.separated(
                separatorBuilder: (context, position) {
                  return Divider();
                },
                key: UniqueKey(),
                itemBuilder: (BuildContext context, int index) {
                  // Why network for web?
                  // See https://pub.dev/packages/image_picker#getting-ready-for-the-web-platform
                  return Dismissible(
                    key: const Key('kjk'),
                    onDismissed: (direction) {
                      _imageFileList!.removeAt(index);
                      streamController.add(_imageFileList!);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                              '${_languageStore.language.imageDeleted}')));
                    },
                    child: Semantics(
                      label: 'image_picker_example_picked_image',
                      child: kIsWeb
                          ? Image.network(_imageFileList![index].path)
                          : Image.file(File(_imageFileList![index].path)),
                    ),
                  );
                },
                itemCount: _imageFileList!.length,
              ),
            ),
          );
        },
        stream: streamController.stream,
      );
    } else if (_pickImageError != null) {
      return Text(
        'Pick image error: $_pickImageError',
        textAlign: TextAlign.center,
      );
    } else {
      return const Text(
        'You have not yet picked an image.',
        textAlign: TextAlign.center,
      );
    }
  }

  Widget _handlePreview() {
    debugPrint("is video $isVideo");
    if (isVideo) {
      return _previewVideo();
    } else {
      return _previewImages();
    }
  }

  Future<void> retrieveLostData() async {
    final LostDataResponse response = await _picker.retrieveLostData();
    if (response.isEmpty) {
      return;
    }
    if (response.file != null) {
      if (response.type == RetrieveType.video) {
        isVideo = true;
        await _playVideo(response.file);
      } else {
        isVideo = false;
        setState(() {
          if (response.files == null) {
            _setImageFileListFromFile(response.file);
          } else {
            _imageFileList = response.files;
          }
        });
      }
    } else {
      _retrieveDataError = response.exception!.code;
    }
  }

  bool initialized = false;

  @override
  Widget build(BuildContext context) {
    if (!initialized && widget.initialImageList != null) {
      _imageFileList = widget.initialImageList;
      initialized = true;
    }
    return Container(
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: FloatingActionButton(
              onPressed: () {
                _displaySelectedMediaDialog(context);
              },
              heroTag: 'showmedia',
              tooltip: 'Show Media',
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: const Icon(Icons.image, color: Colors.white),
                  ),
                  Text(
                      '${_imageFileList == null ? '0' : _imageFileList?.length.toString()}')
                ],
              ),
            ),
          ),
          !widget.hidePickSingleImageFromGallery
              ? Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: FloatingActionButton(
                    onPressed: () {
                      isVideo = false;
                      _onImageButtonPressed(ImageSource.gallery,
                          context: context);
                    },
                    heroTag: 'image0',
                    tooltip: 'Pick Image from gallery',
                    child: const Icon(Icons.photo),
                  ),
                )
              : Container(),
          !widget.hidePickMulipleImageFromGallery
              ? Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: FloatingActionButton(
                    onPressed: () {
                      isVideo = false;
                      _onImageButtonPressed(
                        ImageSource.gallery,
                        context: context,
                        isMultiImage: true,
                      );
                    },
                    heroTag: 'image1',
                    tooltip: 'Pick Multiple Image from gallery',
                    child: const Icon(Icons.photo_library),
                  ),
                )
              : Container(),
          !widget.hideTakeImageByCamera
              ? Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: FloatingActionButton(
                    onPressed: () {
                      isVideo = false;
                      _onImageButtonPressed(ImageSource.camera,
                          context: context);
                    },
                    heroTag: 'image2',
                    tooltip: 'Take a Photo',
                    child: const Icon(Icons.camera_alt),
                  ),
                )
              : Container(),
          !widget.hidePickSingleVideoFromGallery
              ? Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: FloatingActionButton(
                    backgroundColor: Colors.red,
                    onPressed: () {
                      isVideo = true;
                      _onImageButtonPressed(ImageSource.gallery);
                    },
                    heroTag: 'video0',
                    tooltip: 'Pick Video from gallery',
                    child: const Icon(Icons.video_library),
                  ),
                )
              : Container(),
          !widget.hideTakeVideo
              ? Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: FloatingActionButton(
                    backgroundColor: Colors.red,
                    onPressed: () {
                      isVideo = true;
                      _onImageButtonPressed(ImageSource.camera);
                    },
                    heroTag: 'video1',
                    tooltip: 'Take a Video',
                    child: const Icon(Icons.videocam),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }

  Text? _getRetrieveErrorWidget() {
    if (_retrieveDataError != null) {
      final Text result = Text(_retrieveDataError!);
      _retrieveDataError = null;
      return result;
    }
    return null;
  }

  Future<void> _displaySelectedMediaDialog(BuildContext context) async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
                '${_languageStore.language.mediaPickerDialogTitle}'),
            content: Center(
              child: !kIsWeb && defaultTargetPlatform == TargetPlatform.android
                  ? FutureBuilder<void>(
                      future: retrieveLostData(),
                      builder:
                          (BuildContext context, AsyncSnapshot<void> snapshot) {
                        switch (snapshot.connectionState) {
                          case ConnectionState.none:
                          case ConnectionState.waiting:
                            return Text(
                              '${_languageStore.language.noMediaMessage}',
                              textAlign: TextAlign.center,
                            );
                          case ConnectionState.done:
                            return _handlePreview();
                          default:
                            if (snapshot.hasError) {
                              return Text(
                                'Pick image/video error: ${snapshot.error}}',
                                textAlign: TextAlign.center,
                              );
                            } else {
                              return Text(
                                '${_languageStore.language.noMediaMessage}',
                                textAlign: TextAlign.center,
                              );
                            }
                        }
                      },
                    )
                  : _handlePreview(),
            ),
            actions: <Widget>[
              Center(
                child: TextButton(
                  child: const Text('??????????'),
                  onPressed: () {
                    setState(() {
                      Navigator.of(context).pop();
                    });
                  },
                ),
              ),
            ],
          );
        });
  }

  Future<void> _displayPickImageDialog(
      BuildContext context, OnPickImageCallback onPick) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Add optional parameters'),
            content: Column(
              children: <Widget>[
                TextField(
                  controller: maxWidthController,
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  decoration: const InputDecoration(
                      hintText: 'Enter maxWidth if desired'),
                ),
                TextField(
                  controller: maxHeightController,
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  decoration: const InputDecoration(
                      hintText: 'Enter maxHeight if desired'),
                ),
                TextField(
                  controller: qualityController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      hintText: 'Enter quality if desired'),
                ),
              ],
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('CANCEL'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                  child: const Text('PICK'),
                  onPressed: () {
                    final double? width = maxWidthController.text.isNotEmpty
                        ? double.parse(maxWidthController.text)
                        : null;
                    final double? height = maxHeightController.text.isNotEmpty
                        ? double.parse(maxHeightController.text)
                        : null;
                    final int? quality = qualityController.text.isNotEmpty
                        ? int.parse(qualityController.text)
                        : null;
                    onPick(width, height, quality);
                    Navigator.of(context).pop();
                  }),
            ],
          );
        });
  }
}

typedef OnPickImageCallback = void Function(
    double? maxWidth, double? maxHeight, int? quality);

class AspectRatioVideo extends StatefulWidget {
  const AspectRatioVideo(this.controller, {Key? key}) : super(key: key);

  final VideoPlayerController? controller;

  @override
  AspectRatioVideoState createState() => AspectRatioVideoState();
}

class AspectRatioVideoState extends State<AspectRatioVideo> {
  VideoPlayerController? get controller => widget.controller;
  bool initialized = false;

  void _onVideoControllerUpdate() {
    if (!mounted) {
      return;
    }
    if (initialized != controller!.value.isInitialized) {
      initialized = controller!.value.isInitialized;
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    controller!.addListener(_onVideoControllerUpdate);
  }

  @override
  void dispose() {
    controller!.removeListener(_onVideoControllerUpdate);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (initialized) {
      return Center(
        child: AspectRatio(
          aspectRatio: controller!.value.aspectRatio,
          child: VideoPlayer(controller!),
        ),
      );
    } else {
      return Container();
    }
  }
}
