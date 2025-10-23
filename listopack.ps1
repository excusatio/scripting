<# Step 1: permit execution #>
Set-ExecutionPolicy -executionpolicy unrestricted -scope localmachine
<# Step 2: Build a list of packages that you want to install #>
list = (
  "putty.putty",
	"winscp.winscp",
	"7zip.7zip",
	"notepad++.notepad++",
	"gstreamerproject.gstreamer",
	"ChristianKindahl.infrarecorder",
	"keepassxcteam.keepassxc",
	"Microsoft.VisualStudioCode",
	"Python.Python.3.12",
	"mozilla.firefox",
	"brave.brave",
	"4gray.iptvnator",
	"TorProject.TorBrowser",
	"gstreamerproject.gstreamer",
	"rufus.rufus",
  "videolan.vlc"
	"FreePascal.FreePascalCompiler",
	"Rustlang.Rust.GNU",
	"JetBrains.RustRover.EAP",
	"RProject.R",
	"RProject.Rtools",
	"GlobalProtect",
	"google.chrome",
	"microsoft.teams",
  "microsoft.office"
)
<# Step 3: Loop thru the list and install each program #>
foreach ( $item in $list ) {
	# write-host $item
	winget install $item
}
<# Build your own list using "winget search" #>
