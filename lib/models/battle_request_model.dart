class BattleRequestModel {
  final String monster1Id;
  final String monster2Id;

  BattleRequestModel({required this.monster1Id, required this.monster2Id});

  Map<String, String> toJson() {
    return {"monster1Id": monster1Id, "monster2Id": monster2Id};
  }
}
