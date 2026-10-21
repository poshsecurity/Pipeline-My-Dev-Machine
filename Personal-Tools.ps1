$packageIDs = $(
  'Dell.DisplayManager'
  'Discord.Discord'
  'Elgato.StreamDeck'
  'GlassWire.GlassWire'
  'RaspberryPiFoundation.RaspberryPiImager'
  'SteelSeries.GG'
  'Surfshark.Surfshark'
  'tailscale.tailscale'
  'VideoLAN.VLC'
  'WireGuard.WireGuard'
)

$packageIDs.ForEach({winget install -e --id $_})
