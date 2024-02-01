import 'package:faithful_servant/features/mine_servant/presentation/views/widgets/list_item.dart';
import 'package:flutter/material.dart';

class ServantList extends StatefulWidget {
  const ServantList({super.key, required this.filteredList});
  final List filteredList;

  @override
  State<ServantList> createState() => _ServantListState();
}

class _ServantListState extends State<ServantList> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        physics: const AlwaysScrollableScrollPhysics(
            parent: BouncingScrollPhysics()),
        itemCount: widget.filteredList.length,
        itemBuilder: (context, index) {
          return ListItem(dbData: widget.filteredList, index: index);
        },
      ),
    );
  }
}
