import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/presentation/controller/note_event.dart';

import '../../core/services/service_locator.dart';
import '../controller/note_bloc.dart';
import '../controller/note_state.dart';
import 'component/component.dart';
import 'component/note_assign.dart';

class AddNoteScreen extends StatelessWidget {
  AddNoteScreen({Key? key}) : super(key: key);

  var textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => sl<NoteBloc>(),
        child: BlocBuilder<NoteBloc, NoteState>(builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Add Note"),
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
                    style: const TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                        labelText: 'Note',
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(color: Colors.grey))),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Text('Assign To User'),
                  NoteAssign(
                    userId: 0,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  defaultButton(
                      function: (){
                    sl<NoteBloc>().add(InsertNoteEvent(
                        text: textController.text,
                        dateTime: (DateTime.now()).toString(),
                        userId: "4"));
                  },
                      text: 'Save')
                ],
              ),
            ),
          );
        }));
  }
}
