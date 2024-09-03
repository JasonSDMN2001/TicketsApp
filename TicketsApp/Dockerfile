# Use an official .NET runtime as a parent image
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS base
WORKDIR /app
EXPOSE 80
 
# Use the SDK image for building the app
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src
COPY ["TicketsApp/TicketsApp.csproj", "TicketsApp/"]
RUN dotnet restore "TicketsApp/TicketsApp.csproj"
COPY . .
WORKDIR "/src/TicketsApp"
RUN dotnet build "TicketsApp.csproj" -c Release -o /app/build
 
# Publish the app
FROM build AS publish
RUN dotnet publish "TicketsApp.csproj" -c Release -o /app/publish
 
# Final stage: Run the app
FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "TicketsApp.dll"]