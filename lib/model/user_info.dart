class User_info {
  final String realname;
  final String nickname;

  User_info({required this.realname, required this.nickname});

  factory User_info.fromJson(Map<String, dynamic> json) {
    return User_info(
      realname: json['realname'] ?? '',
      nickname: json['nickname'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'realname': realname,
      'nickname': nickname,
    };
  }
}