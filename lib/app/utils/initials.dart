String initials({required String name}) {
  try {
    var split = name.split(' ');
    if (split.length > 2 && split[0].isNotEmpty && split.last.isNotEmpty) {
      return '${split[0][0]}${split.last[0]}'.toUpperCase();
    } else {
      if (split.length > 1 && split[0].isNotEmpty && split[1].isNotEmpty) {
        return '${split[0][0]}${split[1][0]}'.toUpperCase();
      } else {
        if (split[0].length > 1) {
          return split[0].substring(0, 2).toUpperCase();
        } else {
          if (split[0].isEmpty) {
            return 'Y';
          } else {
            return split[0].toUpperCase();
          }
        }
      }
    }
  } on Exception catch (_) {
    return '';
  }
}
