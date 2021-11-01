function Show-Notification {
    [CmdletBinding()]
    param (
        [String]
        $Title,
     
        [Parameter(ValueFromPipeline)]
        [String]
        $Body
    )

    [Windows.UI.Notifications.ToastNotificationManager, Windows.UI.Notifications, ContentType = WindowsRuntime] > $null
    $Template = [Windows.UI.Notifications.ToastNotificationManager]::GetTemplateContent([Windows.UI.Notifications.ToastTemplateType]::ToastText02)
    
    $RawXml = [xml] $Template.GetXml()

    ($RawXml.toast.visual.binding.text | Where-Object { $_.id -eq "1" }).AppendChild($RawXml.CreateTextNode($Title)) > $null
    ($RawXml.toast.visual.binding.text | Where-Object { $_.id -eq "2" }).AppendChild($RawXml.CreateTextNode($Body)) > $null
    
    $SerialisedXml = New-Object Windows.Data.Xml.Dom.XmlDocument
    $SerialisedXml.LoadXml($RawXml.OuterXml)

    $Toast = [Windows.UI.Notifications.ToastNotification]::new($SerialisedXml)
    $Toast.tag = "PowerShell"
    $Toast.Group = "PowerShell"

    $Notifier = [Windows.UI.Notifications.ToastNotificationManager]::CreateToastNotifier("PowerShell")
    $Notifier.Show($Toast)
}

function alert {
    Show-Notification "Finished!" "The script completed."
}