angular_objectory_demo
======================

Sample full stack application with

- Angular.dart as primary framework
- MongoDb as backend DB
- Objectory as object/document mapper
- Rikulo Stream Web server to serve static content and as a container for Objectory WebSocket handler. 

Application based on example from angular.dart.tutorial Chapter 6 with Edit/Add/Remove operations added. 

First steps:

- If you have MongoDB installed locally with default settings, skip that. Otherwise edit connection strings in web/webapp/populate_db.dart and web/webapp/stream_server.dart
- Run web/webapp/populate_db.dart
- Run web/webapp/stream_server.dart 
- Now you may use DartEditor launger or just open Dartium on http://127.0.0.1:8080/