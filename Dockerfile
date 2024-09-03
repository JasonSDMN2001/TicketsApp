# Step 1: Use the official .NET SDK image to build the app
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src
 
# Copy the project file and restore dependencies
COPY ["TicketsApp/TicketsApp.csproj", "./"]
RUN dotnet restore "./TicketsApp.csproj"
 
# Copy the entire source code and build the project
COPY . .
WORKDIR "/src/TicketsApp"
RUN dotnet build "TicketsApp.csproj" -c Release -o /app/build
 
# Step 2: Publish the app
RUN dotnet publish "TicketsApp.csproj" -c Release -o /app/publish
 
# Step 3: Use the official ASP.NET runtime image
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS base
WORKDIR /app
 
# Copy the published app from the build stage
COPY --from=build /app/publish .
 
# Expose the port that the app will run on
EXPOSE 80
 
# Start the app
ENTRYPOINT ["dotnet", "TicketsApp.dll"]