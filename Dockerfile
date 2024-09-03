
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src
 
COPY ["TicketsApp/TicketsApp.csproj", "./"]
RUN dotnet restore "./TicketsApp.csproj"
 
COPY . .
WORKDIR "/src/TicketsApp"
RUN dotnet build "TicketsApp.csproj" -c Release -o /app/build
 
RUN dotnet publish "TicketsApp.csproj" -c Release -o /app/publish
 
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS base
WORKDIR /app
 
COPY --from=build /app/publish .
 
EXPOSE 80
 
ENTRYPOINT ["dotnet", "TicketsApp.dll"]