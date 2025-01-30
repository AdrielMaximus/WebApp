# Usa uma imagem base com JDK 17 (ou outra versão necessária)
FROM openjdk:17-jdk-slim 

# Define o diretório de trabalho dentro do container
WORKDIR /app 

# Copia o código-fonte do projeto para dentro do container
COPY . .

# Constrói a aplicação usando Gradle
RUN ./gradlew build 

# Copia o arquivo JAR gerado para a pasta final
RUN cp build/libs/*.jar app.jar 

# Expõe a porta usada pela aplicação
EXPOSE 8080 

# Comando para rodar a aplicação
CMD ["java", "-jar", "app.jar"]
