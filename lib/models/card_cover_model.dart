import 'package:aukantun/config/app_assets.dart';
import 'package:aukantun/models/enums/mime_type_enum.dart';
import 'package:aukantun/models/enums/source_type_enum.dart';
import 'package:aukantun/models/file_model.dart';
import 'package:flutter/material.dart';

class CardCoverModel {
  final FileModel file;
  final String? _repeat;
  final String? _alignment;

  CardCoverModel({
    required this.file,
    String? repeat,
    String? alignment,
  })  : _repeat = repeat,
        _alignment = alignment;

  factory CardCoverModel.init() {
    return CardCoverModel(
      file: FileModel(
        mimeType: MimeType.png,
        sourceType: SourceType.asset,
        url: AppAssets.coverFacePokerBlack,
      ),
    );
  }

  Alignment get alignment => Alignment.center;
  ImageRepeat get repeat => ImageRepeat.repeat;

  // Convert a Movie object into a Map object
  Map<String, dynamic> toMap() {
    return {
      'file': file.toMap(),
      'repeat': _repeat,
      'alignment': _alignment,
    };
  }

  // Create a Movie object from a Map object
  factory CardCoverModel.fromMap(Map<String, dynamic> map) {
    return CardCoverModel(
      file: FileModel.fromMap(map['file']),
      repeat: map['repeat'],
      alignment: map['alignment'],
    );
  }
}
