import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_learning/models/note_model.dart';
import 'package:hive_learning/ui/note_details_screen.dart';
import 'package:hive_learning/utils/all_colors.dart';
import 'package:hive_learning/utils/all_styles.dart';
import 'package:intl/intl.dart';

import '../controllers/home_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  HomeController homeController = Get.put(HomeController());
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AllColors.blueColor,
        title: Text(
          'NotePad',
          style: AllStyles.titleStyle.copyWith(color: AllColors.whiteColor),
        ),
      ),
      body: GetBuilder<HomeController>(
        builder: (controller) {
          return homeController.notes.isEmpty
              ? Center(child: Text('Empty Note!!!'))
              : ListView.builder(
                  itemCount: homeController.notes.length,
                  itemBuilder: (context, index) {
                    return ListTile(

                      title: Text(homeController.notes[index].title),
                      subtitle: Text(homeController.notes[index].description),
                      trailing: SizedBox(
                        width: 60,
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () => _showUpdateAlert(context, index),
                              child: Icon(
                                Icons.edit,
                                color: AllColors.greyColor,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            InkWell(
                              onTap: () => homeController.deleteNote(index),
                              child: Icon(
                                Icons.delete,
                                color: AllColors.redColor,
                              ),
                            )
                          ],
                        ),
                      ),
                      onTap: () =>Get.to(NoteDetailsScreen(), arguments: {
                        "title": homeController.notes[index].title,
                        "description": homeController.notes[index].description,
                        "date": homeController.notes[index].date
                      }),
                    );
                  },
                );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AllColors.blueColor,
        child: Icon(
          Icons.add,
          color: AllColors.whiteColor,
        ),
        onPressed: () {
          _showAlert(context);
        },
      ),
      //floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  _showAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: SingleChildScrollView(
            child: AlertDialog(
              content: Column(
                children: [
                  TextField(
                    controller: titleController,
                    decoration: InputDecoration(hintText: 'Title'),
                  ),
                  TextField(
                    controller: descriptionController,
                    decoration: InputDecoration(hintText: 'Description'),
                  ),
                ],
              ),
              actions: [
                TextButton(
                  style:
                      TextButton.styleFrom(backgroundColor: AllColors.redColor),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Cancel',
                    style: TextStyle(color: AllColors.whiteColor),
                  ),
                ),
                TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: AllColors.blueColor),
                    onPressed: () {
                      if (titleController.text.isEmpty &&
                          descriptionController.text.isEmpty) {
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                            'Please fill up the form',
                            style: AllStyles.subtitleStyle
                                .copyWith(color: AllColors.whiteColor),
                          ),
                          backgroundColor: AllColors.redColor,
                          elevation: 5,
                          duration: Durations.long1,
                          shape: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8)),
                        ));
                      } else {
                        DateTime now = DateTime.now();
                        String formattedDate =
                            DateFormat('dd MMM yyyy').format(now);
                        Navigator.pop(context);
                        homeController.addNote(NoteModel(titleController.text,
                            descriptionController.text, formattedDate));
                        titleController.clear();
                        descriptionController.clear();
                      }
                    },
                    child: Text('Save',
                        style: TextStyle(color: AllColors.whiteColor))),
              ],
            ),
          ),
        );
      },
    );
  }

  _showUpdateAlert(BuildContext context, index) {
    showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: SingleChildScrollView(
            child: AlertDialog(
              content: Column(
                children: [
                  TextField(
                    controller: titleController,
                    decoration: InputDecoration(hintText: 'Title'),
                  ),
                  TextField(
                    controller: descriptionController,
                    decoration: InputDecoration(hintText: 'Description'),
                  ),
                ],
              ),
              actions: [
                TextButton(
                  style:
                      TextButton.styleFrom(backgroundColor: AllColors.redColor),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Cancel',
                    style: TextStyle(color: AllColors.whiteColor),
                  ),
                ),
                TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: AllColors.blueColor),
                    onPressed: () {
                      if (titleController.text.isEmpty &&
                          descriptionController.text.isEmpty) {
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                            'Please fill up the form',
                            style: AllStyles.subtitleStyle
                                .copyWith(color: AllColors.whiteColor),
                          ),
                          backgroundColor: AllColors.redColor,
                          elevation: 5,
                          duration: Durations.long1,
                          shape: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8)),
                        ));
                      } else {
                        DateTime now = DateTime.now();
                        String formattedDate =
                            DateFormat('dd MMM yyyy').format(now);
                        Navigator.pop(context);
                        homeController.updateNote(
                            NoteModel(titleController.text,
                                descriptionController.text, formattedDate),
                            index);
                        titleController.clear();
                        descriptionController.clear();
                      }
                    },
                    child: Text('Save',
                        style: TextStyle(color: AllColors.whiteColor))),
              ],
            ),
          ),
        );
      },
    );
  }
}
