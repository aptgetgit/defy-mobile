import 'package:flutter/material.dart';

enum CreationStage {
  stageOne,
  stageTwo,
  stageThree,
}

class CreationStageController {
  final PageController controller;
  final CreationStage stage;
  CreationStageController({
    required this.controller,
    required this.stage,
  });

  CreationStageController copyWith({
    PageController? controller,
    CreationStage? stage,
  }) {
    return CreationStageController(
      controller: controller ?? this.controller,
      stage: stage ?? this.stage,
    );
  }
}
