import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:personalapp/models/AboutMe.dart';
import 'package:personalapp/models/Account.dart';
import 'package:personalapp/models/Skill.dart';

class InformationServices {
  static final InformationServices _instance =
      InformationServices._constructor();
  CollectionReference _collectionReference;

  InformationServices._constructor() {
    _collectionReference = Firestore.instance.collection('aja-x.github.io');
  }
  static InformationServices get instance => _instance;

  Future<AboutMe> getAboutMe() async {
    DocumentSnapshot documentSnapshot =
        await _collectionReference.document('about_me').get();

    return AboutMe(
        documentSnapshot.data['name'],
        documentSnapshot.data['education'],
        documentSnapshot.data['short_desc']);
  }

  Future<Account> getAccount() async {
    DocumentSnapshot documentSnapshot =
        await _collectionReference.document('account').get();

    return Account(documentSnapshot.data['email'],
        documentSnapshot.data['github'], documentSnapshot.data['gitlab']);
  }

  Future<Skill> getSkill() async {
    DocumentSnapshot documentSnapshot =
        await _collectionReference.document('skills').get();

    return Skill(
      (documentSnapshot.data['frameworks'] as List)
          .map((e) => e.toString())
          .toList(),
      (documentSnapshot.data['interests'] as List)
          .map((e) => e.toString())
          .toList(),
      (documentSnapshot.data['languages'] as List)
          .map((e) => e.toString())
          .toList(),
      (documentSnapshot.data['tools'] as List)
          .map((e) => e.toString())
          .toList(),
    );
  }
}
