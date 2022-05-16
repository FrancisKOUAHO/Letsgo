ResumeWord(wordText) {
  var words = wordText;
  var word = words.substring(0, 28);
  var fusionWord = word + '...';
  return fusionWord;
}

splitsTheString(string) {
  final splitted = string.split(' ');
  return splitted[0];
}

currentAddressOk(wordText) {
  var words = wordText;
  var splitted = words.split(',');
  return splitted[0] + "" + splitted[1];
}
