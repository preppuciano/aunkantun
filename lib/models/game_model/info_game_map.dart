import 'package:aukantun/models/file_model.dart';

class InfoGameMap {
  final String description;
  final String instructions;
  final String name;
  final String bodyHTML;
  final FileModel poster;
  final int duration;
  final int numberPlayers;
  final int minimumAge;

  InfoGameMap({
    required this.description,
    required this.instructions,
    required this.name,
    required this.bodyHTML,
    required this.poster,
    required this.duration,
    required this.numberPlayers,
    required this.minimumAge,
  });

  // Convert a Movie object into a Map object
  Map<String, dynamic> toMap() {
    return {
      'description': description,
      'instructions': instructions,
      'name': name,
      'bodyHTML': bodyHTML,
      'duration': duration,
      'numberPlayers': numberPlayers,
      'minimumAge': minimumAge,
      'poster': poster.toMap(),
    };
  }

  // Create a Movie object from a Map object
  factory InfoGameMap.fromMap(Map<String, dynamic> map) {
    return InfoGameMap(
      description: map['description'],
      instructions: map['instructions'],
      name: map['name'],
      bodyHTML: map['bodyHTML'],
      duration: map['duration'],
      numberPlayers: map['numberPlayers'],
      minimumAge: map['minimumAge'],
      poster: FileModel.fromMap(map['poster']),
    );
  }
}
