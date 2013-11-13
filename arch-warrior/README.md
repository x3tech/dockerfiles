# x3techarch-warrior

A docker image to run ArchiveTeam Warrior projects in

## Example Usage

Run `puush-grabb` in the foreground as user `docker-example` with 8 concurrent items

    docker run -t -i -e CONCURRENT=8 -e USERNAME=docker-example -e PROJECT_URL="https://github.com/ArchiveTeam/puush-grab.git" x3tech/arch-warrior

Run `puush-grab` in the background with 4 concurrent items

    docker run -d -e CONCURRENT=4 -e USERNAME=docker-example -e PROJECT_URL="https://github.com/ArchiveTeam/puush-grab.git" x3tech/arch-warrior
    
To exit hit ctrl+c twice as run-pipeline currently runs in a while loop with a 1 second sleep
