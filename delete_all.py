import os

delete_map = {
    'java_files': ['pg', 'class'],
    'pg_files': ['spg'],
    'spg_files': ['kg'],
    'kg_files': ['s']
}

for dirs in os.listdir('test_codes'):
    if dirs in delete_map.keys():
        delete_post = delete_map[dirs]
        delete_files = []
        for f in os.listdir('test_codes/' + dirs):
            if f.split('.')[1] in delete_post:
                delete_files.append('test_codes/%s/%s' % (dirs, f))
        for f in delete_files:
            os.remove(f)

print("Deleted all useless files!")
