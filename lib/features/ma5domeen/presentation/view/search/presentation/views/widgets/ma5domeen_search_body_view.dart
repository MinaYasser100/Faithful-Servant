import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Ma5domeenSearchBodyView extends StatefulWidget {
  const Ma5domeenSearchBodyView({super.key, required this.stateName});
  final String stateName;

  @override
  State<Ma5domeenSearchBodyView> createState() =>
      _Ma5domeenSearchBodyViewState();
}

class _Ma5domeenSearchBodyViewState extends State<Ma5domeenSearchBodyView> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: TextFormField(
            decoration: InputDecoration(
              hintText: 'Search here...'.tr,
              suffixIcon: const Icon(Icons.search_rounded),
            ),
          ),
        ),
      ],
    );
  }
}
