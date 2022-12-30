import 'package:flutter/material.dart';
import 'package:master_of_library/colors.dart';
import 'package:master_of_library/fonts.dart';
import 'package:master_of_library/util/extensions.dart';


abstract class TextFieldDelegate {
  void onSubmited(String txt);
  void onChanged(String txt);
}

class UnderlinedTextField extends StatefulWidget  {
  const UnderlinedTextField({
    Key? key,
    required this.delegate,
    required this.onSubmit,
  }) : super(key: key);
  final TextFieldDelegate delegate;
  final VoidCallback onSubmit;
  @override
  State<UnderlinedTextField> createState() => _UnderlinedTextFieldState();
}

class _UnderlinedTextFieldState extends State<UnderlinedTextField> {
  final TextEditingController _textController = TextEditingController();
  bool _isShowTextClose = false;
  @override
  void initState() {
    super.initState();
    _textController.addListener(_changeTextValue);
  }
  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
  _changeTextValue() {
    final text = _textController.text;
    setState(() {
      _isShowTextClose = text.isEmpty ? false : true;
    });
    widget.delegate.onChanged(text);
  }
  _clearText() {
    _textController.clear();
    setState(() {
      _isShowTextClose = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return TextField(
        onSubmitted: (text) {
          widget.delegate.onSubmited(text);
          widget.onSubmit();
        },
      controller: _textController,
      autofocus: false,
      enabled: true,
      decoration: InputDecoration(
          counterText: "",
          isDense:  true,
          enabledBorder:const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.blue),
          ),
          hintText: "힌트를 줍니다.",
          hintStyle: AppFont.large.bold.colored(AppColor.primaryDefault.color),
          suffixIcon: _isShowTextClose ?
          IconButton(onPressed: _clearText, icon: Icon(Icons.close, color: AppColor.grayscaleBlackLight.color,)):
          const SizedBox(width: 26)
      ),
    );
  }
}
