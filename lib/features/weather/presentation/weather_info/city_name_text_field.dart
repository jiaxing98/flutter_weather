import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_weather/core/translations/app_locale.dart';
import 'package:rxdart/rxdart.dart';

class CityNameTextField extends StatefulWidget {
  final void Function(String) onSearch;

  const CityNameTextField({
    super.key,
    required this.onSearch,
  });

  @override
  State<CityNameTextField> createState() => _CityNameTextFieldState();
}

class _CityNameTextFieldState extends State<CityNameTextField> {
  final _debouncedSearchRx = BehaviorSubject<String>();

  @override
  void initState() {
    super.initState();

    _debouncedSearchRx
        .debounceTime(const Duration(milliseconds: 500))
        .listen(widget.onSearch);
  }

  @override
  void dispose() {
    _debouncedSearchRx.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        hintText: AppLocale.searchBarHint.getString(context),
      ),
      onChanged: (value) {
        _debouncedSearchRx.add(value);
      },
    );
  }
}
