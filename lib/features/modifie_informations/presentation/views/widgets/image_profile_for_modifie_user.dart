import 'package:faithful_servant/core/widgets/profile_imge_widget.dart';
import 'package:faithful_servant/features/modifie_informations/presentation/manager/editing_informations_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImageProfileForModifieUser extends StatelessWidget {
  const ImageProfileForModifieUser({
    super.key,
    required this.imageUrl,
  });

  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ProfileImageWidget(
        backgroundImage: NetworkImage(
            BlocProvider.of<EditingInformationsCubit>(context).imageSelected ??
                imageUrl!),
        onPressed: () {
          BlocProvider.of<EditingInformationsCubit>(context).getProfileImage();
        },
      ),
    );
  }
}
