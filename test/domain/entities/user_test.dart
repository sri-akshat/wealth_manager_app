import 'package:flutter_test/flutter_test.dart';
import 'package:wealth_manager_app/domain/entities/user.dart';

void main() {
  test('User object created with valid data', () {
    final user = User(
      id: '1',
      name: 'John Doe',
      email: 'john@example.com',
    );

    expect(user.id, '1');
    expect(user.name, 'John Doe');
    expect(user.email, 'john@example.com');
    expect(user.profileImageUrl, null);
    expect(user.isPremium, false); // Default value
  });

  group('User Entity', () {
    test('User object with custom values', () {
      final user = User(
        id: '2',
        name: 'Jane Smith',
        email: 'jane@example.com',
        profileImageUrl: 'https://example.com/profile.jpg',
        isPremium: true,
      );

      expect(user.id, '2');
      expect(user.name, 'Jane Smith');
      expect(user.email, 'jane@example.com');
      expect(user.profileImageUrl, 'https://example.com/profile.jpg');
      expect(user.isPremium, true);
    });

    test('fromJson and toJson work correctly', () {
      final json = {
        'id': '3',
        'name': 'Bob Johnson',
        'email': 'bob@example.com',
        'profileImageUrl': 'https://example.com/bob.jpg',
        'isPremium': true,
      };

      final user = User.fromJson(json);
      expect(user.id, '3');
      expect(user.name, 'Bob Johnson');
      expect(user.email, 'bob@example.com');

      final serialized = user.toJson();
      expect(serialized, json);
    });
  });
} 