import 'package:animate_do/animate_do.dart';
import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/features/mine_servant/presentation/views/widgets/list_item.dart';
import 'package:faithful_servant/features/register/data/model/user_model.dart';
import 'package:flutter/material.dart';

class ServantList extends StatefulWidget {
  const ServantList({super.key, required this.filteredList});
  final List<UserModel> filteredList;

  @override
  State<ServantList> createState() => _ServantListState();
}

class _ServantListState extends State<ServantList> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RawScrollbar(
        thickness: 6,
        interactive: true,
        radius: const Radius.circular(20),
        thumbColor: kPrimaryColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: ListView.builder(
            physics: const AlwaysScrollableScrollPhysics(
                parent: BouncingScrollPhysics()),
            itemCount: widget.filteredList.length,
            itemBuilder: (context, index) {
              return FadeInDown(
                duration: const Duration(milliseconds: 400),
                animate: true,
                curve: Curves.easeInOut,
                child: ListItem(dbData: widget.filteredList, index: index),
              );
            },
          ),
        ),
      ),
    );
  }
}
