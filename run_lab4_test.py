import os
import sys

if len(sys.argv) <= 1:
    print("--help:")
    print("\t-a, --all: test all files in test_codes/spg_files")
    print("\t-i xxx.spg: test xxx.spg file")
    exit()

if sys.argv[1] == "-a" or sys.argv[1] == "-all":
    spg_files = []
    for test_file in os.listdir("test_codes/spg_files/"):
        if test_file[-4:] == ".spg":
            spg_files.append(test_file)

    flag = True
    for spg_file in spg_files:
        file_name = spg_file[0:-4]
        print("test file %s: " % file_name.ljust(15, ' '), end='')
        os.system("java -cp bin/production/minijava Main test_codes/spg_files/%s"
                  % spg_file)
        ans1 = os.popen("java -jar pgi.jar < test_codes/spg_files/%s.spg" %
                        file_name).read()
        ans2 = os.popen("java -jar kgi.jar < test_codes/pg_files/%s.kg" %
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
    spg_file = sys.argv[2]
    file_name = spg_file[0:-4]
    print("test file %s: " % file_name.ljust(15, ' '), end='')
    os.system("java -cp bin/production/minijava Main test_codes/spg_files/%s"
              % spg_file)
    ans1 = os.popen("java -jar pgi.jar < test_codes/spg_files/%s.spg" %
                    file_name).read()
    ans2 = os.popen("java -jar kgi.jar < test_codes/spg_files/%s.kg" %
                    file_name).read()
    if ans1 == ans2:
        print("\033[32mSuccess\033[0m")
    else:
        print("\033[31mFail\033[0m")
        print("std")
        print(ans1)
        print("output: ")
        print(ans2)