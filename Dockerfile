FROM mcr.microsoft.com/dotnet/sdk:5.0 as build

# Install node
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash
RUN apt-get update && apt-get install -y nodejs
COPY ./DotnetTemplate.Web /app
WORKDIR /app
RUN npm install
RUN dotnet build
RUN npm run build
ENTRYPOINT [ "dotnet", "run" ]