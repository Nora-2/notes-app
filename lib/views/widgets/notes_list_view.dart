import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';

import 'note_item.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        List<NoteModel> notes = BlocProvider.of<NotesCubit>(context).notes!;
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: GridView.builder(
            itemCount: notes.length,
            clipBehavior: Clip.none,
            padding: EdgeInsets.zero,
            
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1,
              crossAxisSpacing: 5,
              mainAxisSpacing: 2,
            ),
            itemBuilder: (context, index) {
              return Padding(
                  padding: const EdgeInsets.all(2),
                  child: NoteItem(
                    note: notes[index],
                  ),
                );
            }),
          //ListView.builder(
          //     itemCount: notes.length,
          //     padding: EdgeInsets.zero,
          //     itemBuilder: (context, index) {
          //       return Padding(
          //         padding: const EdgeInsets.symmetric(vertical: 4),
          //         child: NoteItem(
          //           note: notes[index],
          //         ),
          //       );
          //     }),
        );
      },
    );
  }
}
