import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/presentation/controller/note_event.dart';

import '../../../core/services/service_locator.dart';
import '../../../core/utils/enum.dart';
import '../../controller/note_bloc.dart';
import '../../controller/note_state.dart';
import 'package:flutter/material.dart';
class NoteAssign extends StatefulWidget {
      final int userId;
   NoteAssign({
    Key? key,
     required this.userId
  }) : super(key: key);

   int? index;
  @override
  State<NoteAssign> createState() => _NoteAssignState();
}

class _NoteAssignState extends State<NoteAssign> {



  var nameController=TextEditingController();
  var dropDownValue='';
  @override
  Widget build(BuildContext context) {

    return BlocProvider(
        create: (context)=>sl<NoteBloc>()..add(GetAllUsersEvent()),
        child: BlocBuilder<NoteBloc,NoteState>(
            builder: (context,state){
              switch(state.usersDataState){
                case RequestState.loading:
                  return const Center(child: CircularProgressIndicator());
                case RequestState.loaded:
                  var listOfUsers=state.usersData;


                  return Container(
                    width: 170,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey.withOpacity(0.2)
                    ),
                    child:Center(
                      child: DropdownButton(
                        value:listOfUsers[widget.index??widget.userId].userName,
                        items: listOfUsers.map((e) {
                          return DropdownMenuItem(
                              value: e.userName,
                              child: Text(e.userName)
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          print(newValue);
                          for(int i=0;i<listOfUsers.length;i++){
                           if(listOfUsers[i].userName == newValue) {
                          setState(() {
                            widget.index = i;
                          });
                        }
                      }


                        },
                      ),
                    ) ,
                  );


                case RequestState.error:
                  return Center(child: Text(state.usersDataMessage));
              }
            }));
  }
}


