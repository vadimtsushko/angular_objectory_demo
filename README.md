angular_objectory_demo
======================

Sample full stack application with

- Angular.dart as primary framework
- MongoDb as backend DB
- Objectory as object/document mapper
- Rikulo Stream Web server to serve static content and as a container for Objectory WebSocket handler. 

Application based on example from angular.dart.tutorial Chapter 6 with Edit/Add/Remove operations added. 

First steps:

- If you have MongoDB installed locally with default settings, skip that. Otherwise edit connection strings in bin/populate_db.dart and bin/stream_server.dart
- Run bin/populate_db.dart
- Run bin/stream_server.dart 
- Now you may use DartEditor launcher on web/index.ttml or just open Dartium on http://127.0.0.1:8080/

Demo works with Angular 0.10.0