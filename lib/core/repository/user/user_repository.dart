import 'package:bloc_template/core/repository/user/schema/user_schema.dart';
import 'package:bloc_template/core/services/dio/dio_service.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../../services/gql/gql_service.dart';

class UserRepository {
  static final UserRepository _userRepository = UserRepository._internal();
  factory UserRepository() => _userRepository;
  UserRepository._internal();

  Future<void> getUser() async {
    final response = await GQLService().clientToQuery.query(
          QueryOptions(
            document: gql(queryUser),
            // variables: IF NEED ?
          ),
        );
/*
  if(response.data != null) {
    return User.fromJson(response.data['me'])/
  }  
*/
  }

  // EXAMPLE TO USER DIO SERVICE
  Future<void> getUserDIO() async {
    final response = await DIOService().dio.get("/getUser");
  }
}
