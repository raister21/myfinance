import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:myfinance/features/registration/data/models/profile_model.dart';
import 'package:myfinance/features/registration/domain/entities/profile.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  final ProfileModel profileModel = ProfileModel(name: 'mandip rai');
  test("Should be a subclass of profile entity", () {
    expect(profileModel, isA<Profile>());
  });

  group('fromJson', () {
    test('should return a valid model from json', () async {
      // arrange
      final Map<String, dynamic> jsonMap = json.decode(fixture('profile'));
      // act
      final result = ProfileModel.fromJson(jsonMap);
      // assert
      expect(result, profileModel);
    });
  });
}
