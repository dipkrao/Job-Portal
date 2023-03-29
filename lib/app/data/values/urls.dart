class URLs {
  URLs._privateConstructor();

  //Config APIs
  static const appConfig = "api/config";

  //User APIs
  static const signUp = "/auth/register";
  static const login = "/auth/login";

  // Jobs
  static const createJobs = '/jobs/';
  static getOneJobDetails(String id) => "/jobs/$id";
  static const getAllJobs = "/jobs";
  static const deleteJob = "/jobs";

  // Candiadte
  static const applyToJob = "/candidates/jobs";
  static const getAvailableJobs = "/candidates/jobs";
  static const getAlreadyAppliedJobs = "/candidates/jobs/applied";

  // Recruiter
  static const getPostedJobs = "/recruiters/jobs";
  static getOneJobCandidate(String id) => "/recruiters/jobs/$id/candidates";
}
