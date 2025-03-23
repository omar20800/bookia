import 'dart:math';

import 'package:bookia/core/utils/appcolour.dart';
import 'package:bookia/core/utils/text_style.dart';
import 'package:bookia/core/widgets/dialogs.dart';
import 'package:bookia/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:bookia/features/profile/presentation/cubit/profile_states.dart';
import 'package:bookia/features/profile/presentation/widgets/options_widget.dart';
import 'package:bookia/features/profile/presentation/widgets/profile_header_widget.dart';
import 'package:bookia/features/welcome/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(),
      child: BlocConsumer<ProfileCubit, ProfileStates>(
        listener: (context, state) {
          if (state is ProfileError) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text('something went wrong')));
          } else if (state is ProfileLoading) {
            showLoadingDialog(context);
          } else if (state is ProfileSuccess) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const WelcomeScreen()),
              (route) => false,
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Profile', style: getHeaderTextStyle()),
              centerTitle: true,
              actions: [
                IconButton(
                  icon: const Icon(Icons.logout, color: AppColours.redColor),
                  onPressed: () {
                    context.read<ProfileCubit>().logout();
                  },
                ),
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ProfileHeaderWidget(),
                  const SizedBox(height: 30),
                  OptionsWidget(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
