class Entry {
  String id;
  String entryText;
  bool? isDone;

  Entry(
    this.id,
    this.entryText,
    this.isDone,
  );

  factory Entry.fromJson(Map<String, dynamic> json) {
    return Entry(
        json['id'], json['title'] ?? 'Missing title', json['done'] ?? false);
  }
}
