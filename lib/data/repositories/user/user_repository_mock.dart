import '../../../model/user/user.dart';
import 'user_repository.dart';

class UserRepositoryMock implements UserRepository {
  final List<User> _users = [
    User(
      firstName: 'Alice',
      lastName: 'Martin',
      email: 'alice.martin@example.com',
      phone: '+44 7700 900001',
      profilePicture: 'https://i.pravatar.cc/150?img=1',
      verifiedProfile: true,
    ),
    User(
      firstName: 'Bob',
      lastName: 'Smith',
      email: 'bob.smith@example.com',
      phone: '+44 7700 900002',
      profilePicture: 'https://i.pravatar.cc/150?img=2',
      verifiedProfile: true,
    ),
    User(
      firstName: 'Claire',
      lastName: 'Dupont',
      email: 'claire.dupont@example.com',
      phone: '+33 6 12 34 56 78',
      profilePicture: 'https://i.pravatar.cc/150?img=3',
      verifiedProfile: false,
    ),
    User(
      firstName: 'Diego',
      lastName: 'Garcia',
      email: 'diego.garcia@example.com',
      phone: '+34 612 345 678',
      profilePicture: 'https://i.pravatar.cc/150?img=4',
      verifiedProfile: true,
    ),
    User(
      firstName: 'Emma',
      lastName: 'Johnson',
      email: 'emma.johnson@example.com',
      phone: '+44 7700 900005',
      profilePicture: 'https://i.pravatar.cc/150?img=5',
      verifiedProfile: false,
    ),
  ];

  @override
  List<User> getAllUsers() {
    return List.unmodifiable(_users);
  }
}