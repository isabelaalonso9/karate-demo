# karate-demo

Install:

- JDK
- Apache Maven
- Set the environment variables

Open the Visual Studio Code with Windows (not WSL)

Access the site to get the quickstart (mvn)

[Karate](https://karatelabs.github.io/karate/#getting-started)

Copy that and you should change the `-DgroupId=com.mycompany` to 

- -DgroupId=com.karate

And you should change `-DartifactId=myproject`

to 

- -DartifactId=learnKarate

- Create a folder called Projects
- Inside this folder, create a file called ‘pom.xml’ or copy a existing ‘pom.xml’ file inside this folder
- Use the command on Visual Studio Code Terminal
    - mvn install
- Use the command on Visual Studio Code Terminal to run
    - mvn archetype:generate
    - Fill the question with this values
    - mvn archetype:generate -DarchetypeGroupId=com.intuit.karate -DarchetypeArtifactId=karate-archetype -DarchetypeVersion=1.3.1 -DgroupId=com.karate -DartifactId=learnKarate

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/7b0a8c2b-eda3-46cf-a9d7-019a4aa516c6/Untitled.png)

Ok, now the project has been created

Enter in the folder using

- cd learnKarate

Use this command (name of the file inside src/test/java/examples)

- mvn test -Dtest=ExamplesTest
- the reports will be on the folder target>karate-reports

Extensions to install on Visual Studio Code

- Cucumber (Gherkin) Full Support
- Karate

API Test Automation

- The tests will be written on the .feature files using Gherkin.
- posts.feature

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/c33021fb-dae9-4b96-8d60-c027e6f8e43c/Untitled.png)

- to run the tests, I use the command
    - mvn test
    
    to run a test alone
    
    - mvn test "-Dkarate.options=--tags @dev classpath:mysocial/posts.feature" -Dtest=MySocialTest
    - mvn test "-Dkarate.options=classpath:mysocial/posts.feature" -Dtest=MysocialTest -Dkarate.env=int
