import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note_app/core/utils/app_color.dart';

import '../../core/services/service_locator.dart';
import '../../core/utils/enum.dart';
import '../controller/note_bloc.dart';
import '../controller/note_event.dart';
import '../controller/note_state.dart';
import 'add_note_screen.dart';
import 'add_user_screen.dart';
import 'component/component.dart';
import 'note_edit_screen.dart';

class NoteScreen extends StatelessWidget {
  const NoteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>sl<NoteBloc>()..add(GetNotesEvent()),
      child: BlocBuilder<NoteBloc,NoteState>(
    builder: (context,state){
      switch(state.notesDataState){
        case RequestState.loading:
          return const Center(child: CircularProgressIndicator());
        case RequestState.loaded:
          var notes=state.notesData;
          return Scaffold(
            appBar: AppBar(
              title: Text(
                  "Notes",
                style: GoogleFonts.anybody(
                  fontWeight: FontWeight.bold
                ),
              ),
              actions: [
                IconButton(onPressed: (){
                  navigateTo(context, AddUserScreen());
                }, icon:const Icon(
                    Icons.person_add,
                )),
                IconButton(onPressed: (){}, icon:const  Icon(Icons.settings)),
                IconButton(onPressed: (){}, icon:const  Icon(Icons.menu)),
              ],
            ),
            body:Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      IconButton(onPressed: (){}, icon: const Image(
                          image: AssetImage(
                              'assets/icons/filter.png',

                          ),
                        height: 35,
                        color: mainColor,
                      )),
                      IconButton(onPressed: (){}, icon: const Icon(
                          Icons.search,
                        color: mainColor,
                      )),
                    ],
                  ),
                  Expanded(
                    child: ListView.separated(
                        itemBuilder: (context,index)=>Row(
                          children: [
                            Expanded(
                              child: Text(
                                  notes[index].text,
                                 style:const  TextStyle(
                                   fontWeight: FontWeight.bold,
                                   fontSize: 15,
                                   overflow: TextOverflow.ellipsis
                                 ),
                                 maxLines: 2,
                                overflow: TextOverflow.ellipsis,

                              ),
                            ),
                            const Spacer(),
                            IconButton(onPressed: (){
                              navigateTo(context,  NoteEditScreen(noteId: notes[index].noteId,));
                            }, icon: const Icon(
                                Icons.edit,
                              color: Colors.grey,
                            ))


                          ],
                        ),
                        separatorBuilder: (context,index)=>myDivider(),
                        itemCount: notes.length),
                  ),
                ],
              ),
            ) ,
            floatingActionButton: FloatingActionButton(
              onPressed: (){

                navigateTo(context, AddNoteScreen());
              },
              child:const Icon(Icons.add),
            ),

          );
        case RequestState.error:
          return Center(child: Text(state.notesDataMessage));
      }
    },
    ),
    );
  }
}
