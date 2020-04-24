import os
import sys

if len(sys.argv) <= 1:
    print("--help:")
    print("\t-a, --all: test all files in test_codes/pg_files")
    print("\t-i xxx.pg: test xxx.pg file")
    exit()

if sys.argv[1] == "-a" or sys.argv[1] == "-all":
    pg_files = []
    for test_file in os.listdir("test_codes/pg_files/"):
        if test_file[-3:] == ".pg":
            pg_files.append(test_file)

    flag = True
    for pg_file in pg_files:
        file_name = pg_file[0:-3]
        print("test file %s: " % file_name.ljust(15, ' '), end='')
        os.system("java -cp bin/production/minijava Main test_codes/pg_files/%s"
                  % pg_file)
        parseRes = os.popen("java -jar spp.jar < test_codes/pg_files/%s.spg" %
                            file_name).read()
        if parseRes != "Program parsed successfully\n":
            flag = False
            print("\033[31mFail\033[0m SPiglet syntax error!")
        ans1 = os.popen("java -jar pgi.jar < test_codes/pg_files/%s.pg" %
                        file_name).read()
        ans2 = os.popen("java -jar pgi.jar < test_codes/pg_files/%s.spg" %
                        file_name).read()
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
elif sys.argv[1] == '-i':
    pg_file = sys.argv[2]
    file_name = pg_file[0:-3]
    print("test file %s: " % file_name.ljust(15, ' '), end='')
    os.system("java -cp bin/production/minijava Main test_codes/pg_files/%s"
              % pg_file)
    parseRes = os.popen("java -jar spp.jar < test_codes/pg_files/%s.spg" %
                        file_name).read()
    if parseRes != "Program parsed successfully\n":
        print("\033[31mFail\033[0m SPiglet syntax error!")
    ans1 = os.popen("java -jar pgi.jar < test_codes/pg_files/%s.pg" %
                    file_name).read()
    ans2 = os.popen("java -jar pgi.jar < test_codes/pg_files/%s.spg" %
                    file_name).read()
    if ans1 == ans2:
        print("\033[32mSuccess\033[0m")
    else:
        print("\033[31mFail\033[0m")
        print("std")
        print(ans1)
        print("output: ")
        print(ans2)