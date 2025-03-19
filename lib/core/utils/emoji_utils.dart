import '../constants/animated_emoji.dart';

class EmojiUtils {

  EmojiUtils._();

  static AnimatedEmoji? getEmojiByIndex(int index) {
    final List<AnimatedEmoji> emojiMapping = <AnimatedEmoji>[
      AnimatedEmoji.GrinningFace,
      AnimatedEmoji.GrinningFaceWithBigEyes,
      AnimatedEmoji.GrinningFaceWithSmilingEyes,
      AnimatedEmoji.BeamingFaceWithSmilingEyes,
      AnimatedEmoji.GrinningSquintingFace,
      AnimatedEmoji.GrinningFaceWithSweat,
      AnimatedEmoji.RollingOnTheFloorLaughing,
      AnimatedEmoji.FaceWithTearsOfJoy,
      AnimatedEmoji.SlightlySmilingFace,
      AnimatedEmoji.UpsideDownFace,
      AnimatedEmoji.WinkingFace,
      AnimatedEmoji.SmilingFaceWithSmilingEyes,
      AnimatedEmoji.SmilingFaceWithHalo,
      AnimatedEmoji.SmilingFaceWithHearts,
      AnimatedEmoji.SmilingFaceWithHeartEyes,
      AnimatedEmoji.StarStruck,
      AnimatedEmoji.FaceBlowingAKiss,
      AnimatedEmoji.KissingFace,
    ];

    if (index < 0 || index >= emojiMapping.length) {
      return null;
    }

    return emojiMapping[index];
  }
}
