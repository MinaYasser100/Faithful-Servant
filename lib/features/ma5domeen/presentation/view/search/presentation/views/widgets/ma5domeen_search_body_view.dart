import 'package:faithful_servant/features/ma5domeen/data/model/ma5domeen_model.dart';
import 'package:faithful_servant/features/ma5domeen/presentation/view/search/presentation/views/widgets/ma5domeen_search_content_bady.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Ma5domeenSearchBodyView extends StatefulWidget {
  const Ma5domeenSearchBodyView({super.key, required this.stageName});
  final String stageName;

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
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            itemCount: 12,
            itemBuilder: (context, index) {
              return Ma5domeenSearchContentBady(
                stageName: widget.stageName,
                ma5domeenModel: Ma5domeenModel(
                  name: 'ahdjkhk',
                  registerDate: 'jsdjhkfh',
                  updateRegisterDate: 'jdhfjd',
                  id: 'dhhd',
                  adderName: 'sdjhjkfh',
                  church: 'jsddd',
                  address: 'address',
                  qualification: 'qualification',
                  fatherOfConfession: 'fatherOfConfession',
                  birthDate: 'birthDate',
                  phoneNumber1: 'phoneNumber1',
                  phoneNumber2: 'phoneNumber2', stagename: '',
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
