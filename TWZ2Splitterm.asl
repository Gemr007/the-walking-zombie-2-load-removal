state("The Walking Zombie 2") {}

startup
{
  Assembly.Load(File.ReadAllBytes("Components/asl-help")).CreateInstance("Unity");
}

init
{
  vars.Helper.TryLoad = (Func<dynamic, bool>)(mono =>
  {
    var wz = mono["WalkingZombie", "CWalkingZombie", 1];
    vars.Helper["LoadingInProgress"] = mono.Make<bool>(wz, "instance", "sceneLoadingController", "LoadingInProgress");
    vars.Helper["IsShowMissionCompleted"] = mono.Make<bool>(wz, "instance", "configMissionBase", "IsShowMissionCompleted");
    return true;
  });

}

Split
{
  IsShowMissionCompleted => isShowMissionCompleted;
}

isLoading
{
  return current.LoadingInProgress;
}

exit
{
  timer.IsGameTimePaused = true;
}