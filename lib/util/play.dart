import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fukuda_fuzai/provider/domain_providers.dart';

Future<void> play(WidgetRef ref, String path) async {
  final audio = ref.read(audioProvider);
  await audio.play(DeviceFileSource(path));
}