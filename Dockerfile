# Use the official Dart-Flutter image
FROM cirrusci/flutter:latest

# Set working directory
WORKDIR /app

# Copy everything
COPY . .

# Enable flutter
RUN flutter pub get

# Build the flutter web (optional step if targeting web)
RUN flutter build web

# Expose a port if running as web (optional)
EXPOSE 5000

# Serve the web app using basic server for demo purposes
CMD ["bash", "-c", "cd build/web && python3 -m http.server 5000"]
