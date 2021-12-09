Function New-PoshUI {
<#
.Synopsis
   By G² Development
   PowerShell is able to generate a basic User Interface for the most Commandlets.
.DESCRIPTION
   It doesn't matter if you write your own function or use a provided one from a module.
   The Command "Show-Command" is using a part of the .NET-Framework to automatic build a User Interface based on
   Parameter settings provided by a Commandlet. There are a lot of basic Features which are used in this Function to show up what is possible.
   
   This feature can be used in Windows and by using PowerShell Core on Linux or macOS as well.
   PowerShell Core on Windows https://docs.microsoft.com/en-us/powershell/scripting/install/installing-powershell-on-windows?view=powershell-7.2
   PowerShell on Linux https://docs.microsoft.com/en-us/powershell/scripting/install/installing-powershell-on-linux?view=powershell-7.2
   PowerShell on MacOs https://docs.microsoft.com/en-us/powershell/scripting/install/installing-powershell-on-macos?view=powershell-7.2

   Most functionality of the User Interface Window is configured in the parameter itself.
.EXAMPLE
   Show-Command Basic-PoshUI
.EXAMPLE
   Get-Help Basic-PoshUI -ShowWindow
#>
   [CmdletBinding(
      DefaultParameterSetName = "Use a String", # Choice of default register-card
      # URL to a Documentation
      HelpUri                 = 'https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/show-command?view=powershell-7.2'
   )]
   Param (
   # A basic string field can be defined like the following, 
   # [string]$Param1 (e.q. = "abc")
   [Parameter(
     	Mandatory        = $True, # Field will be required
      ParameterSetName = "Use a String" # register-card for "Use a string" -> can be any other value,
                                        # make sure to make a Set of Parameters with the same name when using this functionality
   )]
   [string]$BasicString,
   
   # A basic integer field can be defined like the following, 
   # [int]$Param2 (e.q. = 0)
   [Parameter(
      Mandatory        = $True, # Field will be required
      ParameterSetName = "Use an Integer" # register-card for "Use a Integer" -> can be any other value,
                                          # make sure to make a Set of Parameters with the same name when using this functionality
   )]
   [ValidateRange(0,31)] # Defines that values from 1 to 30 would be valid
   [int]$BasicInt,

   # If you want to give your users a selection of options 
   [Parameter(
     	Mandatory = $False # Field will not be required
   )]
   [ValidateSet(
      "Option 1",
      "Option 2",
      "Option 3"
   )]
   [string]$DropDown, # Default Option is set to "Option 1" if DropDown is empty

   # A Switch-Parameter is a type of boolean which can be used as a checkbox
   [Parameter(
   )]
   [switch][bool]$CheckBox
   )
   Process {
      # Basic logic for ParameterSets / register-cards
      if ($PSCmdlet.ParameterSetName -eq "Use a String") {
         "The used register-card was 'Use a String'"
         # Output of Value given through the UI
         "Value: $BasicString"
      }
      elseif ($PSCmdlet.ParameterSetName -eq "Use an Integer") {
         "The used register-card was 'Use an Integer'"
         # Output of Value given through the UI
         "Value: $BasicInt"
      }

      # Basic output of the 
      "$DropDown was choosen with dropdown."

      # Basic CheckBox logic
      if ($CheckBox -eq $True) {
         "Box was checked"
      }
      else {
         "Box was unchecked"
      }
   }
}
Show-Command New-PoshUI 
