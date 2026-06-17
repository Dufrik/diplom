Railway deployment notes for TechStoreApp

1) Prepare repository and .gitignore

- Ensure `.gitignore` excludes local credentials (already added):
  - `/src/main/resources/application.properties`
  - `.env` files

- Commit and push to GitHub:

```bash
git add .
git commit -m "chore: prepare repo for Railway deploy"
git branch -M main
git remote add origin <your-repo-url>
git push -u origin main
```

2) Configure Railway

- Create a new project on Railway and choose "Deploy from GitHub".
- Connect your repository and select the `main` branch.
- Add a MySQL plugin (or use Railway's managed MySQL) and copy connection info.

3) Environment variables (Railway Service > Variables)

Set these variables using values from Railway MySQL or your DB provider:

- `SPRING_DATASOURCE_URL` = `jdbc:mysql://<host>:<port>/<dbname>?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC`
- `SPRING_DATASOURCE_USERNAME` = `<db_user>`
- `SPRING_DATASOURCE_PASSWORD` = `<db_password>`
- (optional) `SPRING_JPA_HIBERNATE_DDL_AUTO` = `update`
- (optional) `JAVA_TOOL_OPTIONS` = `-Dfile.encoding=UTF-8`

4) Build & Start commands

- Build command:

```bash
mvn -DskipTests package
```

- Start command:

```bash
java -jar target/productcatalog-0.0.1-SNAPSHOT.jar
```

Railway will run the build command and then start the service with the provided start command.

5) Notes

- Keep credentials out of source control. Use Railway environment variables instead of committing `application.properties`.
- If you want Railway to provision the MySQL database, add the MySQL plugin and use its connection string for `SPRING_DATASOURCE_URL`.
- If you need a specific Java version, configure the Railway project to use Java 17 (check Railway runtime settings).

That's it — after pushing your repo and configuring variables Railway will build and run the app.