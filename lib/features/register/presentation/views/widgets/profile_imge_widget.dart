import 'package:faithful_servant/features/register/presentation/manager/cubit/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileImageWidget extends StatelessWidget {
  const ProfileImageWidget({
    super.key,
    required this.backgroundImage,
  });
  final ImageProvider<Object> backgroundImage;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        CircleAvatar(
          radius: 55,
          backgroundImage: backgroundImage,
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
