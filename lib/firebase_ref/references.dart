import 'package:cloud_firestore/cloud_firestore.dart';

final fireStore = FirebaseFirestore.instance;

//it creates questionPapers collection in firestore and
//we use this reference throught the app
//when uploading data we can call questionPaperRf collecation and upload documents
final questionPaperRF = fireStore.collection('questionPapers');

//creating a new "questions" collection inside the "questionsPapers" collection
DocumentReference questionRF({
  required String paperId,
  required String questionId,
}) =>questionPaperRF.doc(paperId).collection("questions").doc(questionId);
