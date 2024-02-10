import 'package:dakwrite/src/auth/domain/usecases/auth_get_user_usecase.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MainController extends GetxController {
  final AuthGetUserUseCase authGetUserUseCase;

  final currentUser = Rxn<User>(null);

  MainController({
    required this.authGetUserUseCase,
  });

  void getUser() {
    final user =  authGetUserUseCase.execute();
    currentUser.value = user;
  }

}
