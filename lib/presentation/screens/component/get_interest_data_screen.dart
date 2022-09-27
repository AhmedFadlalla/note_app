import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/presentation/controller/user/user_bloc.dart';
import 'package:note_app/presentation/controller/user/user_event.dart';
import 'package:note_app/presentation/controller/user/user_state.dart';

import '../../../core/services/service_locator.dart';
import '../../../core/utils/enum.dart';
class GetInterestDataScreen extends StatefulWidget {
   GetInterestDataScreen({Key? key}) : super(key: key);
   int index=0;
  @override
  State<GetInterestDataScreen> createState() => _GetInterestDataScreenState();
}

class _GetInterestDataScreenState extends State<GetInterestDataScreen> {


  @override
  Widget build(BuildContext context) {


    return BlocProvider(
        create: (context)=>sl<UserBloc>()..add(GetInterestDataEvent()),
      child: BlocBuilder<UserBloc,UserState>(
        builder: (context,state){
          switch(state.interestsDataState){
            case RequestState.loading:
              return const Center(child: CircularProgressIndicator());
            case RequestState.loaded:
              var interests=state.interestsData;
              return Container(
                width: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.grey
                  )
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                  child: DropdownButton(
                    value: interests[widget.index].name,
                      items: interests.map((e) {
                        return DropdownMenuItem(
                            value: e.name,
                            
                            child: Text(e.name)
                        );
                      }).toList(),
                      onChanged: (value){
                      if(value=="Swimming"){
                        setState(() {
                          widget.index=0;
                        });
                      }else if(value=="Football"){
                       setState(() {
                         widget.index=1;
                       });
                      }else{
                       setState(() {
                         widget.index=2;
                       });
                      }

                      }),
                ),
              );
            case RequestState.error:
              return Center(child: Text(state.interestsDataMessage));
          }
        },
      ),
    );
  }
}
