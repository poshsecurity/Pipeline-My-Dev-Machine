$packageIDs = $(
  'Blizzard.BattleNet'
  'ElectronicArts.EADesktop'
  'EpicGames.EpicGamesLauncher'
  'Ubisoft.Connect'
  'Valve.Steam'
)

$packageIDs.ForEach({winget install -e --id $_})
