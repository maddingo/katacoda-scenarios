# Preparation
The code is prepared in branch `02_1_attach_openapi`
`git reset --hard && git switch 02_1_attach_openapi`{{execute T1 interrupt}}

# POM

The `api-handling/pom.xml`{{open}} is configured with:
- surefire plugin (line 53) and
- build-helper plugin (line 82).

There is a test that retrieves the openapi spec in `api-handling/src/test/java/no/maddin/apihandling/controller/OpenApiGeneratorTest.java`{{open}}.

We build the project again `mvn clean install`{{execute T1}}.

Now the contract is attached to the artifact:

`ls ~/.m2/repository/no/maddin/api-handling/1.2.1-SNAPSHOT`{{execute T1}}