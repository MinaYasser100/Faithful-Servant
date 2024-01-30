String? educationalQualificationValidator(value) {
  if (value!.isEmpty) {
    return 'Please, enter your educational qualification';
  }
  return null;
}
