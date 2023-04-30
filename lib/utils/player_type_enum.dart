enum PlayerType { player, computer }

extension PlayerTypeExtension on PlayerType {
  String get playerName {
    switch (this) {
      case PlayerType.player:
        return "Player";
      case PlayerType.computer:
        return "Computer";
      default:
        return "Select a player";
    }
  }
}
