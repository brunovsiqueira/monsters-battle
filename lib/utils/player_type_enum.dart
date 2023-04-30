enum PlayerTypeEnum { player, computer }

extension PlayerTypeExtension on PlayerTypeEnum {
  String get playerName {
    switch (this) {
      case PlayerTypeEnum.player:
        return "Player";
      case PlayerTypeEnum.computer:
        return "Computer";
      default:
        return "Select a player";
    }
  }
}
