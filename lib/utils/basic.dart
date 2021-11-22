int checkLibType(String type) {
  if (type.toLowerCase() == 'tracks') return 0;
  if (type.toLowerCase() == 'albums') return 1;
  if (type.toLowerCase() == 'artists') return 2;
  return 9;
}
