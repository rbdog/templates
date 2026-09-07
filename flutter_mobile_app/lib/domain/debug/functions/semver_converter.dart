import '../types/semver.dart';

class SemverConverter {
  Semver fromString(String versionString) {
    final parts = versionString.split('.').map(int.parse).toList();
    final major = parts[0];
    final minor = parts[1];
    final patch = parts[2];
    return Semver(major, minor, patch);
  }
}
