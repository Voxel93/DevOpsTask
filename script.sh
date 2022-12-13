cd ~/Desktop
mkdir devopstaskfinalscripted
cd devopstaskfinalscripted
git clone https://github.com/FabianGosebrink/ASPNETCore-WebAPI-Sample
cd ASPNETCore-WebAPI-Sample
cd SampleWebApiAspNetCore
dotnet publish -c Release
cat > Dockerfile << EOF
FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build-env
WORKDIR /SampleWebApiAspNetCore
COPY . ./
RUN dotnet restore "./SampleWebApiAspNetCore.csproj" 
RUN dotnet publish -c Release -o out

FROM mcr.microsoft.com/dotnet/aspnet:6.0
WORKDIR /SampleWebApiAspNetCore
COPY --from=build-env /SampleWebApiAspNetCore/out .
ENTRYPOINT [ "dotnet", "SampleWebApiAspNetCore.dll" ]
EOF
docker build -t devopstaskfinalscriptedimg -f Dockerfile .
docker images
docker create --name devopstaskfinalscriptedcont devopstaskfinalscriptedimg
##docker start devopstaskfinalscriptedcont
docker run devopstaskfinalscriptedimg
docker ps

##cat > script.txt
