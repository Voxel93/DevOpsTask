##Create directory
cd ~/Desktop
mkdir devopstaskfinalscripted2
cd devopstaskfinalscripted2

##Download WebAPI
git clone https://github.com/referbruv/ContainerNinja.CleanArchitecture
cd ContainerNinja.CleanArchitecture

##Build and run
cd API
docker-compose build --force-rm --no-cache && docker-compose up
dotnet run --project ./ContainerNinja.API
cd -
cd Client
npm install && npm start







