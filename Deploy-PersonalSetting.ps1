function Deploy-PersonalSetting 
{
  [CmdletBinding()]
  param ()
  
  begin {}
  
  process 
  {
    $WindowsVersion = (Get-ComputerInfo).WindowsVersion
    # WSL
    if ( $WindowsVersion -gt 1903 ) {
      Write-Information "Installing WSL2. Detected Windows Version: $WindowsVersion"
      Enable-WindowsOptionalFeature -FeatureName Microsoft-Windows-Subsystem-Linux -Online -NoRestart
      Enable-WindowsOptionalFeature -FeatureName VirtualMachinePlatform -All -Online 
      Invoke-Expression -Command 'wsl.exe --set-default-version 2'
    }
    else {
      Write-Information "Not Installing WSL2. Detected Windows Version: $WindowsVersion"
    }

    # Hyper-V
    Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All -NoRestart

    # Might want to handle repository trust (PSGallery)
    Install-Module posh-git -Scope CurrentUser
    Install-Module oh-my-posh -Scope CurrentUser
    
    # PowerShell Profile
    New-Item -Path $PROFILE -Force
    Get-Content .\profile.ps1 > $PROFILE
    

    # Applications
    Install-WinPackage 
    Get-WindowsCapability -Name Rsat* -Online | Add-WindowsCapability -Online  
  }
  
  end {}
}

function Install-WinPackage {
  [CmdletBinding()]
  param (
  )
  
  begin {
    
  }
  
  process {
    $Packages = Get-Content
  }
  
  end {
    
  }
}