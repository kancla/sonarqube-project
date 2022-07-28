FROM openjdk:8
ADD target/bioMedical-0.0.3-SNAPSHOT.jar bioMedical-0.0.3-RELEASE.jar.original
EXPOSE 8081
ENTRYPORT ["-java","-jar","bioMedical-0.0.3-SNAPSHOT.jar"]
