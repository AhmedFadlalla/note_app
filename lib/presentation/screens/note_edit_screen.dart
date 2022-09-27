import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/presentation/controller/note_bloc.dart';
import 'package:note_app/presentation/controller/note_event.dart';
import 'package:note_app/presentation/controller/note_state.dart';
import 'package:note_app/presentation/screens/component/component.dart';

import '../../core/services/service_locator.dart';
import '../../core/utils/enum.dart';
import 'component/note_assign.dart';

class NoteEditScreen extends StatefulWidget {
  final String noteId;
  const NoteEditScreen({
    Key? key,
    required this.noteId
  }) : super(key: key);

  @override
  State<NoteEditScreen> createState() => _NoteEditScreenState();
}

class _NoteEditScreenState extends State<NoteEditScreen> {
  @override
  Widget build(BuildContext context) {
    var textController=TextEditingController();
    return BlocProvider(
      create: (context)=>sl<NoteBloc>()..add(GetNoteDataEvent(noteId: widget.noteId)),
      child: BlocBuilder<NoteBloc,NoteState>(
        builder: (context,state){
          switch(state.noteDataState){
            case RequestState.loading:
              return const Center(child: CircularProgressIndicator());
            case RequestState.loaded:
              var noteData=state.noteData;
              textController.text=noteData!.text;
              print(int.parse(noteData.noteId));
              return Scaffold(
                appBar: AppBar(
                  title: const Text('Edit Note'),
                  actions: [
                    IconButton(onPressed: (){
                      sl<NoteBloc>().add(UpdateNoteDataEvent(
                          id: noteData.noteId,
                          text: textController.text,
                          dateTime: (DateTime.now()).toString()));

                      showToast(text: "Note has been edit successfully", state: ToastStates.SUCCESS);
                      Navigator.pop(context);
                    }, icon: const Icon(Icons.save))
                  ],
                ),
                body: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        controller: textController,
                        maxLines: 5,
                        keyboardType: TextInputType.text,
                        style: const TextStyle(
                          color: Colors.black
                        ),
                        decoration: InputDecoration(
                          labelText: 'Note',
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                              color: Colors.grey
                            )
                          )
                        ),
                      ),
                      SizedBox(height: 25,),
                      Text('Assign To User'),
                      NoteAssign(userId: int.parse(noteData.userId),)
                    ],
                  ),
                ),
              );
            case RequestState.error:
              return Center(child: Text(state.noteDataMessage));
          }
        },
      ),
    );
  }
}
