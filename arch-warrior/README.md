# x3techarch-warrior

A docker image to run ArchiveTeam Warrior projects in

## Example Usage

### Run the puush grabber as user docker-example with 8 concurrent items

    docker run -rm -t -i -e CONCURRENT=8 -e USERNAME=docker-example -e PROJECT_URL="https://github.com/ArchiveTeam/puush-grab.git" x3tech/arch-warrior
