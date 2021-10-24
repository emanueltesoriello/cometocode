import 'package:cometocode/src/start/domain/model/start_page_user_response_domain_model.dart';

class StartPageUserResponseRemoteModel {
  late String userId;
  late String name;
  late String surname;

  StartPageUserResponseRemoteModel(
      {required this.userId, required this.name, required this.surname});

  StartPageUserResponseRemoteModel.fromDomain(
      StartPageUserResponseDomainModel domainModel) {
    userId = domainModel.userId;
    name = domainModel.name;
    surname = domainModel.surname;
  }

  StartPageUserResponseDomainModel toDomain() {
    return StartPageUserResponseDomainModel(
        name: name, userId: userId, surname: surname);
  }

  factory StartPageUserResponseRemoteModel.fromJson(
      String id, Map<String, dynamic> json) {
    return StartPageUserResponseRemoteModel(
        userId: id, name: json['name'], surname: json['surname']);
  }
}
