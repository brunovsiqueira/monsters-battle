import 'monster.dart';

class BattleResponse {
  MonsterModel? _winner;
  bool _tie = false;
  String? _message;

  MonsterModel? get winner => _winner;
  bool get tie => _tie;
  String? get message => _message;

  BattleResponse.fromJson(Map<String, dynamic> json) {
    if (json['winner'] != null) {
      _winner = MonsterModel.fromJson(json['winner']);
    }
    _tie = json['tie'] ?? false;
    _message = json['message'] ?? '';
  }
}
