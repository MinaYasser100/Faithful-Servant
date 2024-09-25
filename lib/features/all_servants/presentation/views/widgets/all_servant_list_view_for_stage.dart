import 'package:animate_do/animate_do.dart';
import 'package:faithful_servant/core/function/get_first_three_words.dart';
import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/features/all_servants/servant_details/presentation/views/servant_details_view.dart';
import 'package:faithful_servant/features/register/data/model/user_model.dart';
import 'package:flutter/material.dart';

class AllServantListViewForStage extends StatelessWidget {
  const AllServantListViewForStage({
    super.key,
    required this.serviceUsers,
    this.deleteOnTap,
  });
  final List<UserModel> serviceUsers;
  final void Function()? deleteOnTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RawScrollbar(
        thickness: 6,
        interactive: true,
        radius: const Radius.circular(20),
        child: ListView.builder(
          itemCount: serviceUsers.length,
          itemBuilder: (context, index) {
            return FadeInDown(
              duration: const Duration(milliseconds: 400),
              animate: true,
              curve: Curves.easeInOut,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ServantDetailsView(
                          userModel: serviceUsers[index],
                        ),
                      ));
                },
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: ListTile(
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 14),
                      leading: CircleAvatar(
                        radius: 27,
                        backgroundColor: kPrimaryColor,
                        child: CircleAvatar(
                          radius: 25,
                          backgroundImage:
                              NetworkImage(serviceUsers[index].image),
                        ),
                      ),
                      title: Text(
                        getFirstThreeWords(serviceUsers[index].name),
                      ),
                      subtitle: Text(serviceUsers[index].privilage),
                      trailing: GestureDetector(
                        onTap: deleteOnTap,
                        child: const Icon(
                          Icons.delete,
                          color: kPrimaryColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
