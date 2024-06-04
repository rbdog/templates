import 'package:my_app/logic/types/semantic_version.dart';

class SemanticVersionValidator {}

extension CompareSemanticVersion on SemanticVersion {
  bool operator >(SemanticVersion other) {
    if (major > other.major) {
      return true;
    }
    if (major == other.major && minor > other.minor) {
      return true;
    }
    if (major == other.major && minor == other.minor && patch > other.patch) {
      return true;
    }
    return false;
  }

  bool operator <(SemanticVersion other) {
    if (major < other.major) {
      return true;
    }
    if (major == other.major && minor < other.minor) {
      return true;
    }
    if (major == other.major && minor == other.minor && patch < other.patch) {
      return true;
    }
    return false;
  }
}
