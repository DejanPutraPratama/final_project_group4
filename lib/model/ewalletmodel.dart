class EWallet {
  final String id;
  final String name;
  final String imageUrl;

  EWallet({
    required this.id,
    required this.name,
    required this.imageUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'imageUrl': imageUrl,
    };
  }

  factory EWallet.fromMap(Map<String, dynamic> map) {
    return EWallet(
      id: map['id'],
      name: map['name'],
      imageUrl: map['imageUrl'],
    );
  }
}
