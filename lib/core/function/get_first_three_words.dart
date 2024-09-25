String getFirstThreeWords(String name) {
  // Split the username into a list of words
  List<String> words = name.split(' ');
  // Check if the username has less than three words
  if (words.length < 3) {
    // Join all available words
    return words.join(' ');
  }
  // Take the first three words and join them back into a single string
  return words.sublist(0, 3).join(' ');
}
