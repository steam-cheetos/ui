import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:steamcheetos_flutter/client/dtos.dart';

class GameSummary extends StatelessWidget {
  final GameDto game;
  final VoidCallback? handlePress;

  const GameSummary({required this.game, this.handlePress, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final preview = game.displayImage == null
        ? Text(game.name)
        : Image.network(game.displayImage.toString());

    final completion = game.isCompleted()
        ? const Icon(
            Icons.check_circle,
            size: 80,
            color: Colors.green,
          )
        : CircularPercentIndicator(
            radius: 35.0,
            percent: game.getCompletion(),
            center: Text("${game.achievementsCurrent} / ${game.achievementsTotal}"),
          );

    final content = Row(
        children: [
          Expanded(child: preview, flex: 3),
          Expanded(child: completion)
        ],
    );

    return TextButton(
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
      ),
      onPressed: handlePress,
      child: Card(child: content)
    );
  }
}