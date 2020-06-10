if [ -f "test_codes/java_files/*.pg" ]; then
  rm test_codes/java_files/*.pg
fi

if [ -f "test_codes/java_files/*.class" ]; then
  rm test_codes/java_files/*.class
fi

if [ -f "test_codes/pg_files/*.pg" ]; then
  rm test_codes/pg_files/*.spg
fi

if [ -f "test_codes/spg_files/*.pg" ]; then
  rm test_codes/spg_files/*.kg
fi

if [ -f "test_codes/kg_files/*.pg" ]; then
  rm test_codes/kg_files/*.s
fi
