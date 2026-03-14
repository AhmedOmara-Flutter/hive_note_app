import 'package:flutter/material.dart';
import 'package:hive_note_app/views/widgets/edit_notes_app_view.dart';

class NotesItem extends StatelessWidget {
  const NotesItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => EditNotesAppView()),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: const Color(0xFFF4C978),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Expanded(
                  child: Text(
                    'Flutter Tips',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.delete, color: Colors.black, size: 28),
                  padding: EdgeInsets.all(10),
                  constraints: const BoxConstraints(),
                ),
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: const Text(
                'Build your career with tharwat samy',
                style: TextStyle(
                  fontSize: 20,
                  color: Color(0xFF9E7B4D),
                  height: 1.4,
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Align(
              alignment: Alignment.bottomRight,
              child: Text(
                'May 21,2022',
                style: TextStyle(fontSize: 16, color: Color(0xFF9E7B4D)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
