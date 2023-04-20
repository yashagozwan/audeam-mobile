class MusicalInstrumentModel {
  final String title;
  final String image;
  final String description;

  const MusicalInstrumentModel({
    required this.title,
    required this.description,
    required this.image,
  });

  factory MusicalInstrumentModel.fromJson(Map<String, dynamic> data) {
    return MusicalInstrumentModel(
      image: data['image'],
      title: data['title'],
      description: data['description'],
    );
  }

  static const MusicalInstrumentModel empty = MusicalInstrumentModel(
    title: '',
    description: '',
    image: '',
  );
}
