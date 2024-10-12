class AlexCoffee {
  const AlexCoffee({
    // A string which points to the URL of the coffee image file.
    required this.file,
  });

  factory AlexCoffee.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'file': final String file,
      } =>
        AlexCoffee(file: file),
      _ => throw const FormatException(
          'Failed to parse the alex coffee return json.',
        ),
    };
  }

  final String file;
}
