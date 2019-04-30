import 'package:collection/collection.dart';

int mapPropsToHashCode(List props) {
  int hashCode = 0;

  props.forEach((prop) {
    final propHashCode =
        prop is List ? const ListEquality().hash(prop) : prop.hashCode;

    hashCode = hashCode ^ propHashCode;
  });

  return hashCode;
}

bool equals(List list1, List list2) {
  if (identical(list1, list2)) return true;
  if (list1 == null || list2 == null) return false;

  int length = list1.length;
  if (length != list2.length) return false;

  for (int i = 0; i < length; i++) {
    if (list1[i] is List && list2[i] is List) {
      return const ListEquality().equals(list1[i] as List, list2[i] as List);
    } else {
      return list1[i] == list2[i];
    }
  }

  return true;
}
