patch -p0 <<EOF
diff -ru a/src/native/src/org/apache/hadoop/security/JniBasedUnixGroupsNetgroupMapping.c b/src/native/src/org/apache/hadoop/security/JniBasedUnixGroupsNetgroupMapping.c
--- src/native/src/org/apache/hadoop/security/JniBasedUnixGroupsNetgroupMapping.c 2011-07-19 04:12:32.000000000 +0900
+++ src/native/src/org/apache/hadoop/security/JniBasedUnixGroupsNetgroupMapping.c 2011-10-31 15:27:23.000000000 +0900
@@ -73,7 +73,8 @@
// was successfull or not (as long as it was called we need to call
// endnetgrent)
setnetgrentCalledFlag = 1;
- if(setnetgrent(cgroup) == 1) {
+ setnetgrent(cgroup);
+ {
UserList *current = NULL;
// three pointers are for host, user, domain, we only care
// about user now
 
EOF
 
# build fails if /usr/local/lib directory does not exist
[ -d /usr/local/lib ] || sudo mkdir /usr/local/lib
 
C_INCLUDE_PATH="/System/Library/Frameworks/JavaVM.framework/Headers:$C_INCLUDE_PATH" ant compile-native
 
echo build/native/Mac_OS_X-x86_64-64/lib
ls build/native/Mac_OS_X-x86_64-64/lib
 
echo 'run hadoop as:"
echo '_JAVA_OPTIONS="-Djava.library.path=`pwd`/build/native/Mac_OS_X-x86_64-64/lib" hadoop ...'
