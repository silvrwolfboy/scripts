#!/usr/bin/env python3
import os
import github3
import re
import shutil

root_url = 'https://github.com/'

for repo in github3.repositories_by('momozor'):
    os.system('git clone {}{}'.format(root_url, repo))

    # Pull new commits
    path = re.sub('momozor\/', '', str(repo))
    os.chdir(path)
    os.system('git pull')
    os.chdir('..')

backup_archive_path = '{}/Documents/general/ghb-backup-ar'.format(os.environ['HOME'])

shutil.rmtree(backup_archive_path)
os.makedirs(backup_archive_path)

os.system('tar -cvzf /tmp/momozor-github-backup.tar.gz .; mv /tmp/momozor-github-backup.tar.gz {}'.format(backup_archive_path))

