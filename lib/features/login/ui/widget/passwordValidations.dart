import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/helpers/spaceing.dart';
import 'package:flutter_application_1/core/theming/colors.dart';
import 'package:flutter_application_1/core/theming/styles.dart';

class PasswordValidations extends StatelessWidget {
  final bool hasUpperCase;
  final bool hasLowerCase;
  final bool hasNumber;
  final bool hasSpecialCharacter;
  final bool hasMinLength;
  const PasswordValidations({
    super.key,
    required this.hasUpperCase,
    required this.hasLowerCase,
    required this.hasNumber,
    required this.hasSpecialCharacter,
    required this.hasMinLength,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildValidationRow('at least one uppercase letter', hasUpperCase),
        heightSpace(2),
        buildValidationRow('at least one lowercase letter', hasLowerCase),
        heightSpace(2),
        buildValidationRow('at least one number', hasNumber),
        heightSpace(2),
        buildValidationRow(
          'at least one special character',
          hasSpecialCharacter,
        ),
        heightSpace(2),
        buildValidationRow('at least 8 characters', hasMinLength),
      ],
    );
  }

  Widget buildValidationRow(String text, bool hasValidated) {
    return Row(
      children: [
        CircleAvatar(
          radius: 5,
          backgroundColor: hasValidated ? Colors.green : Colors.grey,
        ),
        widthSpace(6),
        Text(
          text,
          style: TextStyles.font13DarkBlueMedium.copyWith(
            decoration:
                hasValidated ? TextDecoration.lineThrough : TextDecoration.none,
            color: hasValidated ? Colors.green : ColorsManger.darkBlue,
          ),
        ),
      ],
    );
  }
}
