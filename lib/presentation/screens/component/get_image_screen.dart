import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/services/service_locator.dart';
import '../../controller/user/user_bloc.dart';
import '../../controller/user/user_event.dart';
import '../../controller/user/user_state.dart';

class GetImageScreen extends StatefulWidget {
  const GetImageScreen({Key? key}) : super(key: key);

  @override
  State<GetImageScreen> createState() => _GetImageScreenState();
}

class _GetImageScreenState extends State<GetImageScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return  BlocProvider(
        create: (context) => sl<UserBloc>(),
        child: BlocBuilder<UserBloc, UserState>
        (builder: (context, state)
  {
    return Column(
      children: [
        Center(
          child: CircleAvatar(
            radius: 55,
            backgroundImage: state.userImage != null
                ? Image.file(state.userImage!).image
                : const NetworkImage(
                "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
          ),
        ),
        SizedBox(
          height: height * 0.01,
        ),
        Center(
          child: InkWell(
            child: const Text(
              "Select Image",
              style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold),
            ),
            onTap: () {

              setState(() {
                sl<UserBloc>().add(GetUserImageEvent());
              });
            },
          ),
        ),
      ],
    );
  })
    );
  }
}
