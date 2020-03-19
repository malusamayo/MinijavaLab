workplace=$(pwd)
cd bin/production/minijava || (echo "no such folder, please build it before you run tests"; exit)
echo "My Test:" > "$workplace/res.txt"
for file in ../../../test_code/private_tests/tests/*
do
  # shellcheck disable=SC2129
  echo "**********************************************************************************" >> "$workplace/res.txt"
  echo "${file}" >> "$workplace/res.txt"
  grep -ns TE "$file" >> "$workplace/res.txt"
  java Main "$file" >> "$workplace/res.txt"
  echo "**********************************************************************************" >> "$workplace/res.txt"
  printf "\n" >> "$workplace/res.txt"
done
