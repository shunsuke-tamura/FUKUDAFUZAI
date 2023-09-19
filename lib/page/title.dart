import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fukuda_fuzai/provider/presentation_provider.dart';
import 'package:fukuda_fuzai/util/constant/color_constant.dart';
import 'package:fukuda_fuzai/util/constant/text_style_constant.dart';
import 'package:go_router/go_router.dart';

class TitlePage extends ConsumerWidget {
  const TitlePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(nameTextFieldController);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('名前を入力して'),
          TextFormField(
            controller: controller,
            textAlign: TextAlign.left,
            autofocus: true,
            cursorColor: ColorConstant.black30,
            decoration: const InputDecoration(
              fillColor: ColorConstant.black90,
              filled: true,
              hintText: 'メッセージを入力',
              hintStyle: TextStyle(fontSize: 16, color: ColorConstant.black50),
              floatingLabelBehavior: FloatingLabelBehavior.never,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                borderSide: BorderSide.none,
              ),
            ),
            style: TextStyleConstant.normal16
                .copyWith(color: ColorConstant.black30),
          ),
          ElevatedButton(
            onPressed: () {
              context.push('/qr');
            },
            child: Text('qrコードを読み取る'),
          ),
        ],
      ),
    );
  }
}
