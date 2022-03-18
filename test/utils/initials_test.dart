import 'package:bar_gym_app/app/utils/initials.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Initials', () {
    test('Parse first and last initials correctly from more than two words',
        () {
      expect(initials(name: 'Zachary Bruce Johnson'), 'ZJ');
    });
    test('Parse first and last initials correctly from two words', () {
      expect(initials(name: 'Zachary Smith'), 'ZS');
    });
    test('Parse first two initials correctly from one word', () {
      expect(initials(name: 'Zachary'), 'ZA');
    });
    test('Return Y if no name is present', () {
      expect(initials(name: ''), 'Y');
    });
  });
}
