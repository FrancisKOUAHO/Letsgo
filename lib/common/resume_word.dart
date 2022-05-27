ResumeWord(wordText) {
  var words = wordText;
  var word = words.substring(0, 25);
  var fusionWord = word + '...';
  return fusionWord;
}

splitsTheString(string) {
  final splitted = string.split(' ');
  return splitted[0];
}

currentAddressOk(wordText) {
  String words = wordText;
  String oldWord = "";
  if (words != "") {
    var splitted = words.split(',');
    oldWord = "${splitted[0]},${splitted[1]}";
    return oldWord;
  } else {
    return oldWord;
  }
}
