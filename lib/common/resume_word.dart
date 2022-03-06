ResumeWord(wordText) {
  var words = wordText;
  var word = words.substring(1, 50);
  var fusionWord = word + '...';

  return fusionWord;
}


sliceNameAndLastname(wordText) {
  var words = wordText;
  var splitted = words.split(' ');

  return splitted[0];
}
