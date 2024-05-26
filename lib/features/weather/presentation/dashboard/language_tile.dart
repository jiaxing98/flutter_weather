import 'package:flutter/material.dart';

class LanguageTile extends StatelessWidget {
  final String selectedLanguage;
  final String languageCode;
  final String label;
  final void Function() onTap;

  const LanguageTile({
    super.key,
    required this.selectedLanguage,
    required this.languageCode,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 24.0,
              child: selectedLanguage == languageCode
                  ? const Icon(Icons.check)
                  : null,
            ),
            const SizedBox(width: 16.0),
            Text(
              label,
              style: const TextStyle(fontSize: 18.0),
            ),
          ],
        ),
      ),
    );
  }
}
