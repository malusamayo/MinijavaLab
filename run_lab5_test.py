import os
import sys

if len(sys.argv) <= 1:
    print("--help:")
    print("\t-a, --all: test all files in test_codes/kg_files")
    print("\t-i xxx.kg: test xxx.kg file")
    exit()

if sys.argv[1] == "-a" or sys.argv[1] == "-all":
    kg_files = []
    for test_file in os.listdir("test_codes/kg_files/"):
        if test_file[-3:] == ".kg":
            kg_files.append(test_file)

    flag = True
    for kg_file in kg_files:
        file_name = kg_file[0:-3]
        print("test file %s: " % file_name.ljust(15, ' '), end='')
        os.system("java -cp bin/production/minijava Main test_codes/kg_files/%s"
                  % kg_file)
        ans1 = os.popen("java -jar kgi.jar < test_codes/kg_files/%s.kg" %
                        file_name).read()
        ans2 = os.popen("spim -file test_codes/kg_files/%s.s" %
                        file_name).read()
        while ans2[0] != '\n':
            ans2 = ans2[1:]
        ans2 = ans2[1:]
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
    kg_file = sys.argv[2]
    file_name = kg_file[0:-3]
    print("test file %s: " % file_name.ljust(15, ' '), end='')
    os.system("java -cp bin/production/minijava Main test_codes/kg_files/%s"
              % kg_file)
    ans1 = os.popen("java -jar kgi.jar < test_codes/kg_files/%s.kg" %
                    file_name).read()
    ans2 = os.popen("spim -file test_codes/kg_files/%s.s" %
                    file_name).read()
    while ans2[0] != '\n':
        ans2 = ans2[1:]
    ans2 = ans2[1:]
    if ans1 == ans2:
        print("\033[32mSuccess\033[0m")
    else:
        print("\033[31mFail\033[0m")
        print("std")
        print(ans1)
        print("output: ")
        print(ans2)
