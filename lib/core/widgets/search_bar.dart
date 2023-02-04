import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'styles.dart';

class SearchBar extends StatefulWidget {
  final TextEditingController searchController;
  final void Function() onClear;
  final void Function(String?)? onSubmit;
  final String? hint;

  const SearchBar(
      {required this.searchController,
      required this.onClear,
      this.onSubmit,
      this.hint,
      Key? key})
      : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36.0,
      child: TextFormField(
        controller: widget.searchController,
        decoration: VStyle.boxSearch(
          hintText: widget.hint ?? 'searchHint'.tr,
          onClear: widget.onClear,
          useSuffix: widget.searchController.text.isNotEmpty,
        ),
        onChanged: (v) => setState(() {}),
        onFieldSubmitted: widget.onSubmit,
      ),
    );
  }
}
