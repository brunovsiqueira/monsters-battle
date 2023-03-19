class BattleRequest {
  final String monster1Id;
  final String monster2Id;

  BattleRequest(this.monster1Id, this.monster2Id);

  Map<String, String> toJson() {
    return {"monster1Id": monster1Id, "monster2Id": monster2Id};
  }
}
