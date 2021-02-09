class UserService {
  Future<void> login(String username, String password) async {
    print('login: $username // $password');
  }

  Future<void> register(String username, String password) async {
    print('register: $username // $password');
  }
}
