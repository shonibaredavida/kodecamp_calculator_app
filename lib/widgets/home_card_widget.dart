import 'package:flutter/material.dart';

class HomeCardWidget extends StatelessWidget {
  const HomeCardWidget({
    super.key,
    required this.calcFunctionPix,
    required this.calcFuntionTitle,
  });

  final String calcFunctionPix;
  final String calcFuntionTitle;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(10),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
          elevation: 5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                calcFunctionPix,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                calcFuntionTitle,
                style: const TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
