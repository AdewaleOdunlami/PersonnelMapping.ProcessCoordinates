#See https://aka.ms/containerfastmode to understand how Visual Studio uses this Dockerfile to build your images for faster debugging.

FROM mcr.microsoft.com/dotnet/core/aspnet:3.1-buster-slim AS base
WORKDIR /app
ENV ASPNETCORE_URLS=http://*:5003

FROM mcr.microsoft.com/dotnet/core/sdk:3.1-buster AS build
WORKDIR /src
COPY ["*", "ProcessCoordinates/"]
RUN dotnet restore "ProcessCoordinates/PersonnelMapping.ProcessCoordinates.csproj"
COPY . .
WORKDIR "/src/ProcessCoordinates"
RUN ls
RUN dotnet build "PersonnelMapping.ProcessCoordinates.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "PersonnelMapping.ProcessCoordinates.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "PersonnelMapping.ProcessCoordinates.dll"]