import 'package:faithful_servant/core/widgets/profile_imge_widget.dart';
import 'package:faithful_servant/features/register/presentation/manager/cubit/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImgeRegisterWidget extends StatelessWidget {
  const ImgeRegisterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ProfileImageWidget(
        backgroundImage: NetworkImage(BlocProvider.of<RegisterCubit>(context)
                .imageSelected ??
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRzb62jTDtJjG9KgljxtM0vPyWOq_16WOkIgA&usqp=CAU'),
        onPressed: () {
          BlocProvider.of<RegisterCubit>(context).getProfileImage();
        },
      ),
    );
  }
}
