#!/usr/bin/env python
import re
import sys

out = open("pom.xml", "w")

tmpl_beg = """
<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/maven-v4_0_0.xsd">
  <modelVersion>4.0.0</modelVersion>
  <groupId>com.mycompany.app</groupId>
  <artifactId>git-rep</artifactId>
  <packaging>jar</packaging>
  <version>1.0-SNAPSHOT</version>
  <name>git-rep</name>
  <url>http://maven.apache.org</url>

  <repositories>
  <repository>
  <id>cloudera</id>
  <url>https://repository.cloudera.com/artifactory/cloudera-repos/</url>
  </repository>
  </repositories>

  <dependencies>
"""
out.write(tmpl_beg)

tmpl_contrib_dep = """
      <dependency>
          <groupId>%s</groupId>
          <artifactId>%s</artifactId>
          <version>1.0.0</version>
          <scope>system</scope>
          <systemPath>/Users/oleg/git-rep/%s</systemPath>
      </dependency>
"""

skip_jars = (
        "tmp/contrib/hadoop-0.20.2-cdh3u4m20/lib/commons-lang-2.4.jar"
        )

for line in open(sys.argv[1]):
    full_path_jar = re.search("[^\"]*\.jar", line)
    jar = re.search("[^(\"|/)]*\.jar", line)
    if full_path_jar is not None:
        full_path_jar = full_path_jar.group(0)
        jar = jar.group(0)
        if full_path_jar in skip_jars:
            continue
        out.write(tmpl_contrib_dep % (jar, jar, full_path_jar))

out.write("""
  </dependencies>
  <build>
      <plugins>

          <plugin>
              <groupId>org.codehaus.mojo</groupId>
              <artifactId>build-helper-maven-plugin</artifactId>
              <version>1.8</version>
              <executions>
                  <execution>
                      <phase>generate-sources</phase>
                      <goals><goal>add-source</goal></goals>
                      <configuration>
                          <sources>
                              <source>projects/hadoop_tools/src</source>
                              <source>projects/java/common/src</source>
                              <source>projects/protogen/java/src</source>
                              <source>projects/protogen/java/src.gen</source>
                              <source>projects/image/jar/src</source>
                              <source>projects/image_search/src</source>
                          </sources>
                      </configuration>
                  </execution>
              </executions>
          </plugin>

      </plugins>
  </build>

</project>
""")

out.close()

sys.exit()



