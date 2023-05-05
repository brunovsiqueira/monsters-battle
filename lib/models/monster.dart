import 'package:equatable/equatable.dart';

class MonsterModel extends Equatable {
  final String name;
  final String imageUrl;
  final int attack;
  final int defense;
  final int hp;
  final int speed;
  final String id;

  MonsterModel(this.name, this.imageUrl, this.attack, this.defense, this.hp,
      this.speed, this.id);

  MonsterModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        imageUrl = json['imageUrl'],
        attack = json["attack"],
        defense = json["defense"],
        hp = json["hp"],
        speed = json["speed"];

  @override
  List<Object?> get props => [name, imageUrl, attack, defense, hp, speed, id];
}
