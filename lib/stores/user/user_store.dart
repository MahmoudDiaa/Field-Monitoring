import 'package:Field_Monitoring/data/network/api_response_new_entity.dart';
import 'package:Field_Monitoring/stores/error/error_store.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

import '../../data/respository/user_repository.dart';
import '../login_form/login_form_store.dart';

part 'user_store.g.dart';

class UserStore = _UserStore with _$UserStore;
@Singleton()
abstract class _UserStore with Store {
  // repository instance
  final UserRepository _repository;

  // store for handling form errors
  final LoginFormErrorStore formErrorStore = LoginFormErrorStore();

  // store for handling error messages
  final ErrorStore errorStore = ErrorStore();

  // bool to check if current user is logged in
  bool isLoggedIn = false;

  // constructor:---------------------------------------------------------------
  _UserStore(UserRepository repository) : this._repository = repository {
    // setting up disposers
    _setupDisposers();

    // checking if user is logged in
    repository.isLoggedIn.then((value) {
      this.isLoggedIn = value;
    });
  }

  // disposers:-----------------------------------------------------------------
  late List<ReactionDisposer> _disposers;

  void _setupDisposers() {
    _disposers = [
      reaction((_) => success, (_) => success = false, delay: 200),
    ];
  }

  // empty responses:-----------------------------------------------------------
  static ObservableFuture<LoginResponseEntity?> emptyLoginResponse =
      ObservableFuture.value(null);

  // store variables:-----------------------------------------------------------
  @observable
  bool success = false;

  @observable
  ObservableFuture<LoginResponseEntity?> loginFuture = emptyLoginResponse;

  @computed
  bool get isLoading => loginFuture.status == FutureStatus.pending;


  // actions:-------------------------------------------------------------------
  @action
  Future login(String email, String password) async {
    final future = _repository.login(email, password);
    loginFuture = ObservableFuture(future);
    await future.then((value) async {
      if (value?.accessToken != null) {
        _repository.saveIsLoggedIn(true);
        _repository.saveAuthToken(value!.accessToken!);
        this.isLoggedIn = true;
        this.success = true;
      } else {
        print('failed to login');
      }
    }).catchError((e) {
      print(e);
      this.isLoggedIn = false;
      this.success = false;
      throw e;
    });
  }

  logout() {
    this.isLoggedIn = false;
    _repository.saveIsLoggedIn(false);
    _repository.removeLoggedInUser();
  }

  @action
  User getUser()=>
    _repository.getUserData();


  // general methods:-----------------------------------------------------------
  @disposeMethod
  void dispose() {
    for (final d in _disposers) {
      d();
    }
  }
}
