import os
from argparse import ArgumentParser

from yaml import load, dump
try:
    from yaml import CLoader as Loader, CDumper as Dumper
except ImportError:
    from yaml import Loader, Dumper


def main():
    args = load_args()
    increment_meta_yaml_file(args.build_type, args.repo_dir)


def load_args():
    """ parse the arguments of the qdaemon and qstart exes """
    parser = ArgumentParser()
    parser.add_argument("--build-type",
                        required=True,
                        choices=['version', 'feature', 'patch'],
                        help="Input he type of build to run."
                        )
    parser.add_argument("--repo-dir",
                        required=True,
                        help="Path to the git repo"
                        )
    return parser.parse_args()

def increment_meta_yaml_file(build_type, repo_dir):
    # read in the yaml file
    meta_file = os.path.join(repo_dir, 'info/recipe/meta.yaml')
    with open(meta_file, 'r') as stream:
        data = load(stream, Loader=Loader)
    # increment the build version
    version = data['package']['version']
    new_version = increment_version(version, build_type)
    data['package']['version'] = new_version
    # write back to yaml
    with open(meta_file, 'w') as out_file:
        output = dump(data, out_file, Dumper=Dumper)
    print(new_version)

def increment_version(version, build_type):
    split_reversed = version.split('.')[::-1]
    for i, b in enumerate(['patch', 'feature', 'version']):
        if b != build_type:
            split_reversed[i] = '0'
        else:
            split_reversed[i] = str(1 + int(split_reversed[i]))
            return '.'.join(split_reversed[::-1])

def test_increment():
    version = '5.5.5'
    if '5.5.6' != increment_version(version, 'patch'):
        raise Exception('Patch test failed')
    if '5.5.0' != increment_version(version, 'feature'):
        raise Exception('Feature test failed')
    if '6.0.0' != increment_version(version, 'version'):
        raise Exception('Version test failed')

if __name__=='__main__':
    main()
