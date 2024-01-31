import 'package:faithful_servant/core/helper/assets.dart';
import 'package:faithful_servant/features/register/presentation/manager/cubit/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileImageWidget extends StatelessWidget {
  const ProfileImageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        CircleAvatar(
          radius: 55,
          backgroundImage: AssetImage(Assets.jesusAndYourSon),
        ),
        CircleAvatar(
          child: IconButton(
            onPressed: () {
              BlocProvider.of<RegisterCubit>(context).getProfileImage();
            },
            icon: const Icon(
              Icons.edit,
            ),
          ),
        )
      ],
    );
  }
}
