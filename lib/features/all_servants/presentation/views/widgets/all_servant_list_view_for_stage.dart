import 'package:animate_do/animate_do.dart';
import 'package:faithful_servant/core/function/get_first_three_words.dart';
import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/core/helper/styles.dart';
import 'package:faithful_servant/features/all_servants/servant_details/presentation/views/servant_details_view.dart';
import 'package:faithful_servant/features/register/data/model/user_model.dart';
import 'package:flutter/material.dart';

class AllServantListViewForStage extends StatelessWidget {
  const AllServantListViewForStage({
    super.key,
    required this.serviceUsers,
  });
  final List<UserModel> serviceUsers;

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
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(10), // Card border radius
                    side: const BorderSide(
                      color: kPrimaryColor, // Border color
                      width: 2, // Border width
                    ),
                  ),
                  elevation: 4, // Card shadow elevation
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 14),
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
                      style: Styles.textStyle18,
                    ),
                    subtitle: Text(serviceUsers[index].privilage),
                    trailing: CircleAvatar(
                      backgroundColor: kPrimaryColor,
                      child: Text(
                        '${index + 1}',
                        style: const TextStyle(
                          color: kSecondColor,
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
