$packageIDs = $(
  'Adobe.Acrobat.Reader.64-bit'
  'Axosoft.GitKraken'
  'Git.Git'
  'Microsoft.IntelligentTerminal'
  'Microsoft.PowerShell'
  'Microsoft.PowerShell.Preview'
  'Microsoft.VisualStudioCode'
  'Microsoft.VisualStudioCode.Insiders'
  'Microsoft.WindowsTerminal'
  'Microsoft.WindowsTerminal.Preview'
  'Python.Launcher'
  'WinDirStat.WinDirStat'
  'WinMerge.WinMerge'
  'WinSCP.WinSCP'
)

$packageIDs.ForEach({winget install -e --id $_})
