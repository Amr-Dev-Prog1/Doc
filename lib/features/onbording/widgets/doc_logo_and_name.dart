import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DocLogoAndName extends StatelessWidget {
  const DocLogoAndName({super.key});

  @override
  Widget build(BuildContext context) {
    return    Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                   children: [
                     SvgPicture.asset(
                      'assets/svgs/DocDoc-logo.svg',
                      width: 40,
                      height: 40,
                                     ),
                      const Text("DocDoc"
                      ,style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                   ],
                 );
  }
}