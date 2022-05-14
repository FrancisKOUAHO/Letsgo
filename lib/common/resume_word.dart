ResumeWord(wordText) {
  var words = wordText;
  var word = words.substring(0, 28);
  var fusionWord = word + '...';

  return fusionWord;
}

ResumeTitle(wordText) {
  var words = wordText;
  var splitted = words.split(' ');
  return splitted[0] + " " + splitted[1] + " " + splitted[2];
}

sliceNameAndLastname(wordText) {
  var words = wordText;
  var splitted = words.split(' ');
  return splitted[0];
}


//test avec caract invisble
/*sliceNameAndLastname(wordText) {
  var words = wordText;
  var splitted = words.split('⠀');
  return splitted[0];
}*/

currentAddressOk(wordText) {
  var words = wordText;
  var splitted = words.split(',');
  return splitted[0] + "" + splitted[1];
}
