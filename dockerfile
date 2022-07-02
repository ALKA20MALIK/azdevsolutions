FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build-env 

WORKDIR /taxcalculator

#copy all the content from current folder into container
Copy . ./

#Restore
RUN dotnet restore                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
#Build and Publish
RUN dotnet publish -c Release -o out

#Build runtime image
FROM mcr.microsoft.com/dotnet/runtime:5.0

WORKDIR /taxcalculator
copy --from=build-env /taxcalculator/out
ENTRYPOINT ["dotnet","taxcalculator.dll"]


