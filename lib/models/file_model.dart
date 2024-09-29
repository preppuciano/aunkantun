import 'package:aukantun/config/app_assets.dart';
import 'package:aukantun/models/enums/mime_type_enum.dart';
import 'package:aukantun/models/enums/source_type_enum.dart';
import 'package:flutter/material.dart';

class FileModel {
  final String? alt;
  final String? path;
  final String url;
  final int? size;
  final MimeType mimeType;
  final SourceType sourceType;

  FileModel({
    this.alt,
    this.path,
    required this.url,
    this.size,
    required this.sourceType,
    required this.mimeType,
  });

  ImageProvider get imageProvider {
    if (sourceType == SourceType.network) {
      return NetworkImage(url);
    } else if (sourceType == SourceType.asset) {
      return AssetImage(url);
    }
    return AssetImage(AppAssets.coverFacePokerBlack);
  }

  // Convert a Movie object into a Map object
  Map<String, dynamic> toMap() {
    return {
      'alt': alt,
      'path': path,
      'url': url,
      'size': size,
      'mimeType': MimeTypeHelper.mimeTypeToString(mimeType),
      'sourceType': SourceTypeHelper.sourceTypeToString(sourceType),
    };
  }

  // Create a Movie object from a Map object
  factory FileModel.fromMap(Map<String, dynamic> map) {
    return FileModel(
      alt: map['alt'],
      path: map['path'],
      url: map['url'],
      size: (map['size']).toInt(),
      mimeType: MimeTypeHelper.stringToMimeType(map['mimeType']),
      sourceType: SourceTypeHelper.stringToSourceType(map['sourceType']),
    );
  }
}
