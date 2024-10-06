import 'package:flutter/material.dart';

import '../file.dart';

final class AudioFile extends File {
  const AudioFile({
    super.key, 
    required super.title,
    required super.size,
  }) : super(icon: Icons.music_note);
}