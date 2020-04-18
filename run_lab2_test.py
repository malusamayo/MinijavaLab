import os

java_files = []
for test_file in os.listdir("lab2_res/java_files/"):
    if test_file[-5:] == ".java":
        java_files.append(test_file)

flag = True

for java_file in java_files:
    file_name = java_file[0:-5]
    os.system("javac lab2_res/java_files/%s" % java_file)
    os.system("java -cp bin/production/minijava Main lab2_res/java_files/%s"
              % java_file)
    ans1 = os.popen("java -cp lab2_res/java_files/ %s" % file_name).read()
    ans2 = os.popen("java -jar pgi.jar < lab2_res/java_files/%s.pg" %
                    file_name).read()
    print("test file %s: " % file_name.ljust(15, ' '), end='')
    if ans1 == ans2:
        print("\033[32mSuccess\033[0m")
    else:
        flag = False
        print("\033[31mFail\033[0m")
        print("std")
        print(ans1)
        print("output: ")
        print(ans2)
if flag:
    print("Passed all test files!")
