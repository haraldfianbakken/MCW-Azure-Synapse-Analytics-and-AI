$rgName = 'hsf-synapse-demo3'
$rg = new-azresourcegroup $rgName -location 'west europe'

#$suffix = 'hsfun12';
$suffix = Read-Host -Prompt "Enter a unique suffix for your environment"
$sqlPassword = Read-Host -Prompt "Enter the SQL Administrator password you used in the deployment" -AsSecureString
# If you're lazy and don't like t
#$sqlPassword = 'P@ssw0rd1234-/!!'|ConvertTo-SecureString -AsPlainText -force
$sqlPassword1 = [System.Runtime.InteropServices.Marshal]::PtrToStringUni([System.Runtime.InteropServices.Marshal]::SecureStringToCoTaskMemUnicode($sqlPassword))
$uri = 'https://raw.githubusercontent.com/haraldfianbakken/MCW-Azure-Synapse-Analytics-and-AI/main/Hands-on%20lab/environment-setup/automation/00-asa-workspace-core.json'

$deployment = New-AzResourceGroupDeployment -ResourceGroupName $rg.ResourceGroupName -TemplateUri $uri -uniqueSuffix $suffix -sqlAdministratorLoginPassword $sqlPassword
./01-environment-setup.ps1 -resourceGroupName $rg.ResourceGroupName -SQLPassword $sqlPassword1 -suffix $suffix
