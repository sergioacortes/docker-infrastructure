$currentPath = Get-Location

Function Run-DockerComposeUp {
    
    [cmdletbinding()]
    Param (
        [string]$dockerComposeFile = "docker-compose.yaml",
        [string]$profileName
    )

    Process {
        
        $dockerComposePath = "$currentPath/$dockerComposeFile"

        docker-compose --file $dockerComposePath --profile $profileName up -d
    
    }

}

Function Run-DockerComposeDown {
    
    [cmdletbinding()]
    Param (
        [string]$dockerComposeFile = "docker-compose.yaml",
        [string]$profileName
    )

    Process {
        
        $dockerComposePath = "$currentPath\$dockerComposeFile"

        docker-compose --file $dockerComposePath --profile $profileName down
    
    }

}

while ($option -ne 0) {

    Write-Host '
    Utilities
    1.- infrastructure
    2.- infrastructure-messaging
    3.- Infrastructure-microsoft
    4.- Infrastructure-mongodb
    5.- Infrastructure-monitoring
    
    Docker compose DOWN:
    51.- infrastructure
    52.- infrastructure-messaging
    53.- Infrastructure-microsoft
    54.- Infrastructure-mongodb
    55.- Infrastructure-monitoring

    0.- Exit
    '
    $option = Read-Host -Prompt 'Select the bounded context to run'

    switch ($option) {
        1 {
            Run-DockerComposeUp -profileName "infrastructure"
        }
        2 {
            Run-DockerComposeUp -profileName "infrastructure-messaging"
        }
        3 {
            Run-DockerComposeUp -profileName "infrastructure-microsoft"
        }
        4 {
            Run-DockerComposeUp -profileName "infrastructure-mongodb"
        }
        5 {
            Run-DockerComposeUp -profileName "infrastructure-monitoring"
        }

        0 {
            Write-Host "Exiting..."
            break
        }
        default {
            Write-Host "Invalid option. Please try again."
        }
    }

}
