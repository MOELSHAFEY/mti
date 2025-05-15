class NoteModel {
  final String headline;
  final String description;
  final DateTime time;

  NoteModel({
    required this.headline,
    required this.description,
    required this.time,
  });

  factory NoteModel.fromJson(Map<String, dynamic> json) { //get
    return NoteModel(
      headline: json['headline'] as String,
      description: json['description'] as String,
      time: DateTime.parse(json['time'] as String),
    );
  }

  Map<String, dynamic> toJson() { //save
    return {
      'headline': headline,
      'description': description,
      'time': time.toIso8601String(),
    };
  }
}