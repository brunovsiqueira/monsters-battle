import 'monster.dart';

class BattleResponseModel {
  final MonsterModel? winner;
  final bool tie;
  final String? message;

  BattleResponseModel(
      {required this.winner, required this.message, this.tie = false});
  factory BattleResponseModel.fromJson(Map<String, dynamic> json) {
    return BattleResponseModel(
        winner: MonsterModel.fromJson(json['winner']),
        message: json['message'],
        tie: json['tie'] ?? false);
  }
}
