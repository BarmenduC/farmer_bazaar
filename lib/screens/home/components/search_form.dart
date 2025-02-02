import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants.dart';

const OutlineInputBorder outlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(12)),
  borderSide: BorderSide.none,
);

class SearchForm extends StatelessWidget {
  const SearchForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Form(
          child: Expanded(
            child: TextFormField(
              onSaved: (value) {
                FocusScope.of(context).unfocus();
              },
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: "Search items...",
                hintStyle: const TextStyle(fontSize: 14),
                border: outlineInputBorder,
                enabledBorder: outlineInputBorder,
                focusedBorder: outlineInputBorder,
                errorBorder: outlineInputBorder,
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(14),
                  child: SvgPicture.asset("assets/icons/Search.svg"),
                ),
              ),
            ),
          ),
        ),
        Filters(),
      ],
    );
  }
}

class Filters extends StatelessWidget {
  const Filters({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: defaultPadding, vertical: defaultPadding / 2),
      child: SizedBox(
        width: 48,
        height: 48,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: primaryColor,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
          ),
          onPressed: () {},
          child: SvgPicture.asset("assets/icons/Filter.svg"),
        ),
      ),
    );
  }
}