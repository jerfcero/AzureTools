################# Azure Blob Storage - PowerShell ####################  
 
## Input Parameters  
$resourceGroupName="ccoe-clive-rsg-etherbilling001"  
$storageAccName="etherbillclivexgsta001"  
$containerName="etherbilling"  
 
## Connect to Azure Account  
Connect-AzAccount   
 
## Function to get all the blobs  
Function GetAllBlobs  
{  
    Write-Host -ForegroundColor Green "Retrieving all blobs from storage container.."    
    ## Get the storage account   
    $storageAcc=Get-AzStorageAccount -ResourceGroupName $resourceGroupName -Name $storageAccName     
    ## Get the storage account context  
    $ctx=$storageAcc.Context  
    ## Get all the containers  
    $containers=Get-AzStorageContainer  -Context $ctx         
    ## Get all the blobs  
    $blobs=Get-AzStorageBlob -Container $containerName  -Context $ctx  
    ## Loop through all the blobs
    Start-Transcript -Path .\file_export.txt
    foreach($blob in $blobs)  
    {  
        write-host -Foregroundcolor Yellow $blob.Name
    }
    Stop-Transcript
}  
  
GetAllBlobs   
 
## Disconnect from Azure Account  
Disconnect-AzAccount 
