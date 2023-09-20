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
    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('名前を入力して'),
          FormWidget(),
        ],
      ),
    );
  }
}

final _formKey = GlobalKey<FormState>();

class FormWidget extends StatelessWidget {
  const FormWidget({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextFormField(
              decoration: InputDecoration(labelText: 'Enter alphabet only'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
                  return 'Please enter only alphabet characters';
                }
                return null;
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                context.push('/qr');
              }
            },
            child: const Text('qrコードを読み取る'),
          )
        ],
      ),
    );
  }
}

