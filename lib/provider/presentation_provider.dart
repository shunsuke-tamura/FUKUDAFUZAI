import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fukuda_fuzai/model/entity/user_setting/user_setting_entity.dart';

final nameTextFieldController = Provider((_) => TextEditingController());

final qrCodeDataProvider = StateProvider((ref) => '');

final pointerIndexProvider = StateProvider((ref) => 0);

final xRouteProvider = StateProvider<double>((ref) => 0);

final zRouteProvider = StateProvider<double>((ref) => 0);

final scoreProvider = StateProvider<int>((ref) => 0);

final userSettingProvider = StateProvider<UserSettingEntity?>((ref) => null);