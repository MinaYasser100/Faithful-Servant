import 'package:faithful_servant/core/function/get_user_data.dart';
import 'package:faithful_servant/features/ma5domeen/presentation/view/widgets/ma5domeen_view_for_ameen_el2etaa3_widgets/ma5domeen_view_for_ameen_el2etaa3_body.dart';
import 'package:faithful_servant/features/register/data/model/user_model.dart';
import 'package:flutter/material.dart';

class Ma5domeenViewForAmeenEl2etaa3 extends StatefulWidget {
  const Ma5domeenViewForAmeenEl2etaa3({super.key});

  @override
  State<Ma5domeenViewForAmeenEl2etaa3> createState() => _Ma5domeenViewForAmeenEl2etaa3();
}

class _Ma5domeenViewForAmeenEl2etaa3 extends State<Ma5domeenViewForAmeenEl2etaa3> {
  late Future<UserModel?> userModelFuture;
late int startNum;
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
          if(userModel.currentService=="ابتدائي") {
            return const Ma5domeenViewForAmeenEl2etaa3Body(itemCount: 8,numToStart: 0,);
          }
          else if(userModel.currentService==" اعدادي و ثانوي"){
            return const Ma5domeenViewForAmeenEl2etaa3Body(itemCount: 5,numToStart: 8,);
          }
          else{
            return const Ma5domeenViewForAmeenEl2etaa3Body(itemCount: 5,numToStart: 1,);
          }
        } else {
          // If no data is available (userModel is null)
          return const Center(child: Text('No user data available.'));
        }
      },
    );
  }
 
}
