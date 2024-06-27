class Notice {
  final String title;
  final String date;
  final String detail;

  Notice({required this.title, required this.date, required this.detail});

  factory Notice.fromJson(Map<String, dynamic> json) {
    return Notice(
      title: json['title'] ?? '',
      date: json['date'] ?? '',
      detail: json['detail'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'date': date,
      'detail': detail,
    };
  }
}
