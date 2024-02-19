class Country {
  String id;
  String path;
  String color;
  String name;

  Country({
    required this.id,
    required this.path,
    required this.name,
    this.color = 'D7D3D2',
  });
}
