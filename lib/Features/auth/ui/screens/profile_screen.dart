import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ieee/Features/auth/ui/widgets/tabBar_profile.dart';

import 'package:ieee/Features/cubits/auth_cubit/auth_cubit.dart';

import 'package:ieee/core/constant/app_color.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  User? user = FirebaseAuth.instance.currentUser;
  @override
  void initState() {
    super.initState();
    context.read<UserCubit>().loadUserName();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              " THE GAZETTE ",
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontSize: 20),
            ),
            const Spacer(),
            CircleAvatar(backgroundColor: Colors.red, radius: 15),
          ],
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Divider(color: Colors.red, thickness: 1),
        ),
      ),

      body: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.settings, size: 30, color: AppColor.grey),
            ),
          ),
          SizedBox(height: 20),
      
          Container(
            width: 100,
      
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
      
              border: Border.symmetric(
                vertical: BorderSide(color: AppColor.red, width: 2),
                horizontal: BorderSide(color: AppColor.red, width: 2),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: CircleAvatar(backgroundColor: Colors.black, radius: 50),
            ),
          ),
          SizedBox(height: 10),
          Text(
            "PREMIUM MEMBER",
            style: TextStyle(
              fontSize: 14,
              color: AppColor.red,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5),
          BlocBuilder<UserCubit, String>(
            builder: (context, state) {
              return Text(
                state.isNotEmpty ? state : "No username found",
                style: TextStyle(
                  fontSize: 26,
                  color: AppColor.black,
                  fontWeight: FontWeight.bold,
                ),
              );
            },
          ),
        SizedBox(height: 10),
          Text("Created At: ${user?.metadata.creationTime}",style: TextStyle(color: AppColor.grey),),
          SizedBox(height: 10),
          
          Divider(color: AppColor.red, thickness: 1, endIndent: 50, indent: 50),
          SizedBox(height: 10),
          Expanded(child: TabBarScreen()),
          
        ],
      ),
    );
  }
}
