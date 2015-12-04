#
# Master.ps1
#

#Login-AzureRmAccount

$tenantID = "b7f604a0-00a9-4188-9248-42f3a5aac2e9"
$subscriptionID = "ec4b8e6e-6a27-4430-a1ac-3ded010cb563"
$subscriptionName = "EMJU-pf"
$ResourceGroupLocation = "westus"

$NetworkTemplate = "..\Templates\EMJU.Network.json"
$SSHBastionTemplate ="..\Templates\EMJU.SSH-VMs.json"
$PublicServiceTemplate = "..\Templates\EMJU.PublicService-VMs.json"

$subscriptionArgs = @()
$subscriptionArgs += ("-ResourceGroupLocation", $ResourceGroupLocation)
$subscriptionArgs += ("-SubscriptionID",$subscriptionID)
$subscriptionArgs += ("-SubscriptionName",$subscriptionName)
$subscriptionArgs += ("-TenantID",$tenantID)


Set-AzureRmContext -SubscriptionId $subscriptionID -SubscriptionName $subscriptionName -TenantId $tenantID

#Network
$invokeArgs = @()
$invokeArgs += ("-ResourceGroupName","EMJU-AZPF-Network")
$invokeArgs += ("-TemplateFile", $NetworkTemplate)
$invokeArgs += ("-TemplateParametersFile","..\Templates\EMJU.Network.param.dev.json")
$invokeArgs += $subscriptionArgs
Invoke-Expression ".\Deploy-EMJU.Network.ps1 $invokeArgs"

#SSH Bastion
$invokeArgs = @()
$invokeArgs += ("-ResourceGroupName","EMJU-AZPF-SSH-VMs")
$invokeArgs += ("-TemplateFile", $SSHBastionTemplate)
$invokeArgs += ("-TemplateParametersFile","..\Templates\EMJU.SSH-VMs.param.pf.json")
$invokeArgs += $subscriptionArgs
Invoke-Expression ".\Deploy-EMJU.SSH-VMs.ps1 $invokeArgs"

#Public Services
################
#ClipEventProcessing
$invokeArgs = @()
$invokeArgs += ("-ResourceGroupName","EMJU-AZPF-ClipEventProcessing-VMs")
$invokeArgs += ("-TemplateFile", $PublicServiceTemplate)
$invokeArgs += ("-TemplateParametersFile","..\Templates\EMJU.PublicService-VMs-ClipEventProcessing.param.pf.json")
$invokeArgs += $subscriptionArgs
Invoke-Expression ".\Deploy-EMJU.ClipEventProcessing-VMs.ps1 $invokeArgs"

#Clipping
$invokeArgs = @()
$invokeArgs += ("-ResourceGroupName","EMJU-AZPF-Clipping-VMs")
$invokeArgs += ("-TemplateFile", $PublicServiceTemplate)
$invokeArgs += ("-TemplateParametersFile","..\Templates\EMJU.PublicService-VMs-Clipping.param.pf.json")
$invokeArgs += $subscriptionArgs
Invoke-Expression ".\Deploy-EMJU.Clipping-VMs.ps1 $invokeArgs"

#CoreServices
$invokeArgs = @()
$invokeArgs += ("-ResourceGroupName","EMJU-AZPF-CoreServices-VMs")
$invokeArgs += ("-TemplateFile", $PublicServiceTemplate)
$invokeArgs += ("-TemplateParametersFile","..\Templates\EMJU.PublicService-VMs-CoreServices.param.pf.json")
$invokeArgs += $subscriptionArgs
Invoke-Expression ".\Deploy-EMJU.CoreServices-VMs.ps1 $invokeArgs"

#CoreServicesMobile
$invokeArgs = @()
$invokeArgs += ("-ResourceGroupName","EMJU-AZPF-CoreServicesMobile-VMs")
$invokeArgs += ("-TemplateFile", $PublicServiceTemplate)
$invokeArgs += ("-TemplateParametersFile","..\Templates\EMJU.PublicService-VMs-CoreServicesMobile.param.pf.json")
$invokeArgs += $subscriptionArgs
Invoke-Expression ".\Deploy-EMJU.CoreServicesMobile-VMs.ps1 $invokeArgs"

#Gallery
$invokeArgs = @()
$invokeArgs += ("-ResourceGroupName","EMJU-AZPF-Gallery-VMs")
$invokeArgs += ("-TemplateFile", $PublicServiceTemplate)
$invokeArgs += ("-TemplateParametersFile","..\Templates\EMJU.PublicService-VMs-Gallery.param.pf.json")
$invokeArgs += $subscriptionArgs
Invoke-Expression ".\Deploy-EMJU.Gallery-VMs.ps1 $invokeArgs"

#GalleryMobile
$invokeArgs = @()
$invokeArgs += ("-ResourceGroupName","EMJU-AZPF-GalleryMobile-VMs")
$invokeArgs += ("-TemplateFile", $PublicServiceTemplate)
$invokeArgs += ("-TemplateParametersFile","..\Templates\EMJU.PublicService-VMs-GalleryMobile.param.pf.json")
$invokeArgs += $subscriptionArgs
Invoke-Expression ".\Deploy-EMJU.GalleryMobile-VMs.ps1 $invokeArgs"

#MiscServicesMobile
$invokeArgs = @()
$invokeArgs += ("-ResourceGroupName","EMJU-AZPF-MiscServicesMobile-VMs")
$invokeArgs += ("-TemplateFile", $PublicServiceTemplate)
$invokeArgs += ("-TemplateParametersFile","..\Templates\EMJU.PublicService-VMs-MiscServicesMobile.param.pf.json")
$invokeArgs += $subscriptionArgs
Invoke-Expression ".\Deploy-EMJU.MiscServicesMobile-VMs.ps1 $invokeArgs"

#MyCard
$invokeArgs = @()
$invokeArgs += ("-ResourceGroupName","EMJU-AZPF-MyCard-VMs")
$invokeArgs += ("-TemplateFile", $PublicServiceTemplate)
$invokeArgs += ("-TemplateParametersFile","..\Templates\EMJU.PublicService-VMs-MyCard.param.pf.json")
$invokeArgs += $subscriptionArgs
Invoke-Expression ".\Deploy-EMJU.MyCard-VMs.ps1 $invokeArgs"

#MyList
$invokeArgs = @()
$invokeArgs += ("-ResourceGroupName","EMJU-AZPF-MyList-VMs")
$invokeArgs += ("-TemplateFile", $PublicServiceTemplate)
$invokeArgs += ("-TemplateParametersFile","..\Templates\EMJU.PublicService-VMs-MyList.param.pf.json")
$invokeArgs += $subscriptionArgs
Invoke-Expression ".\Deploy-EMJU.MyList-VMs.ps1 $invokeArgs"

#MyListMobile
$invokeArgs = @()
$invokeArgs += ("-ResourceGroupName","EMJU-AZPF-MyListMobile-VMs")
$invokeArgs += ("-TemplateFile", $PublicServiceTemplate)
$invokeArgs += ("-TemplateParametersFile","..\Templates\EMJU.PublicService-VMs-MyListMobile.param.pf.json")
$invokeArgs += $subscriptionArgs
Invoke-Expression ".\Deploy-EMJU.MyListMobile-VMs.ps1 $invokeArgs"

#OfferSetup
$invokeArgs = @()
$invokeArgs += ("-ResourceGroupName","EMJU-AZPF-OfferSetup-VMs")
$invokeArgs += ("-TemplateFile", $PublicServiceTemplate)
$invokeArgs += ("-TemplateParametersFile","..\Templates\EMJU.PublicService-VMs-OfferSetup.param.pf.json")
$invokeArgs += $subscriptionArgs
Invoke-Expression ".\Deploy-EMJU.OfferSetup-VMs.ps1 $invokeArgs"

#PartnerClipping
$invokeArgs = @()
$invokeArgs += ("-ResourceGroupName","EMJU-AZPF-PartnerClipping-VMs")
$invokeArgs += ("-TemplateFile", $PublicServiceTemplate)
$invokeArgs += ("-TemplateParametersFile","..\Templates\EMJU.PublicService-VMs-PartnerClipping.param.pf.json")
$invokeArgs += $subscriptionArgs
Invoke-Expression ".\Deploy-EMJU.PartnerClipping-VMs.ps1 $invokeArgs"

#ScanMobile
$invokeArgs = @()
$invokeArgs += ("-ResourceGroupName","EMJU-AZPF-ScanMobile-VMs")
$invokeArgs += ("-TemplateFile", $PublicServiceTemplate)
$invokeArgs += ("-TemplateParametersFile","..\Templates\EMJU.PublicService-VMs-ScanMobile.param.pf.json")
$invokeArgs += $subscriptionArgs
Invoke-Expression ".\Deploy-EMJU.ScanMobile-VMs.ps1 $invokeArgs"

#SortByAisleMobile
$invokeArgs = @()
$invokeArgs += ("-ResourceGroupName","EMJU-AZPF-SortByAisleMobile-VMs")
$invokeArgs += ("-TemplateFile", $PublicServiceTemplate)
$invokeArgs += ("-TemplateParametersFile","..\Templates\EMJU.PublicService-VMs-SortByAisleMobile.param.pf.json")
$invokeArgs += $subscriptionArgs
Invoke-Expression ".\Deploy-EMJU.SortByAisleMobile-VMs.ps1 $invokeArgs"

#WeeklyAdMobile
$invokeArgs = @()
$invokeArgs += ("-ResourceGroupName","EMJU-AZPF-WeeklyAdMobile-VMs")
$invokeArgs += ("-TemplateFile", $PublicServiceTemplate)
$invokeArgs += ("-TemplateParametersFile","..\Templates\EMJU.PublicService-VMs-WeeklyAdMobile.param.pf.json")
$invokeArgs += $subscriptionArgs
Invoke-Expression ".\Deploy-EMJU.WeeklyAdMobile-VMs.ps1 $invokeArgs"