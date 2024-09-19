import 'package:faithful_servant/core/function/get_user_data.dart';
import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/core/helper/get_pages.dart';
import 'package:faithful_servant/core/helper/styles.dart';
import 'package:faithful_servant/core/widgets/design_body.dart';
import 'package:faithful_servant/features/ma5domeen/presentation/manager/ma5domeen_cubit.dart';
import 'package:faithful_servant/features/ma5domeen/presentation/view/widgets/ma5domeen_widgets/ma5domeen_body.dart';
import 'package:faithful_servant/features/register/data/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class Ma5domeenViewForGeneral extends StatefulWidget {
  const Ma5domeenViewForGeneral({super.key});

  @override
  State<Ma5domeenViewForGeneral> createState() => _Ma5domeenView();
}

class _Ma5domeenView extends State<Ma5domeenViewForGeneral> {
  late Future<UserModel?> userModelFuture;

  @override
  void initState() {
    userModelFuture = getUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<UserModel?>(
      future: userModelFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Show a loading spinner while waiting for the user model to load
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          // Handle error state
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (snapshot.hasData && snapshot.data != null) {
          // User model is loaded, now we can proceed
          final userModel = snapshot.data!;
          return BlocProvider(
            create: (context) => Ma5domeenCubit()
              ..gettingMa5domeenData(userModel.currentService),
            child: Scaffold(
              backgroundColor: kPrimaryColor,
              appBar: AppBar(
                backgroundColor: kPrimaryColor,
                foregroundColor: kSecondColor,
                leading: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(Icons.arrow_back_rounded),
                ),
                title: Text(
                  userModel.currentService,
                  style: Styles.textStyle25SecondColor,
                ),
                actions: [
                  IconButton(
                    onPressed: () {
                      Get.toNamed(
                        GetPages.kMa5domeenSearchView,
                        arguments: userModel.currentService,
                      );
                    },
                    icon: const Icon(
                      Icons.search_rounded,
                      size: 30,
                    ),
                  ),
                ],
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  Get.toNamed(GetPages.addMa5domeenview,
                      arguments: userModel.currentService);
                },
                backgroundColor: kPrimaryLightColor,
                child: const Icon(Icons.add),
              ),
              body: DesignBody(
                widget: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Ma5domeenBody(
                    nameStage: userModel.currentService,
                  ),
                ),
              ),
            ),
          );
        } else {
          // If no data is available (userModel is null)
          return const Center(child: Text('No user data available.'));
        }
      },
    );
  }
}
