import 'package:flutter/material.dart';
import 'package:myfm_app/size_config.dart';

class CustomAlertDialog extends StatelessWidget {
  final IconData icon;
  final String text;
  final String? btnText;
  final VoidCallback? press;
  const CustomAlertDialog({
    super.key,
    required this.icon,
    required this.text,
    this.btnText,
    this.press,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
      ),
      content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: getProportionateScreenWidth(30)),
          SizedBox(height: getProportionateScreenHeight(5)),
          Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: getProportionateScreenWidth(18),
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
      actionsPadding: EdgeInsets.only(
          bottom: btnText != null ? getProportionateScreenHeight(15) : 0),
      actionsAlignment: MainAxisAlignment.spaceEvenly,
      actions: [
        btnText != null
            ? OutlinedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(
                    width: 1.2,
                    color: Colors.black,
                  ),
                ),
                child: const Text(
                  'Cancel',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              )
            : const SizedBox(),
        btnText != null
            ? OutlinedButton(
                onPressed: press,
                style: OutlinedButton.styleFrom(backgroundColor: Colors.black),
                child: Text(
                  btnText!,
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w600),
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}
