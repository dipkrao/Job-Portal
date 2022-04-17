///Firebase is a Backend-as-a-Service (BaaS) app development platform
///that provides hosted backend services such as a realtime database,
///cloud storage, authentication, crash reporting, machine learning,
///remote configuration, and hosting for your static files.
///Firebase supports Flutter.
abstract class FirebaseService {
  Future<void> initCrashlytics();

  Future<void> initFirebase();
}
