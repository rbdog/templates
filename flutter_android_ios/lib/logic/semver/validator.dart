// Project imports:
import 'types/semver.dart';

class SemverValidator {}

extension CompareSemver on Semver {
  bool operator >(Semver other) {
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

  bool operator <(Semver other) {
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
