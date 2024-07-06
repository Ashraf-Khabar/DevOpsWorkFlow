import os
from robot import run

test_dir = os.getcwd()+'./tests/test_cases'

print(f"Current working directory: {os.getcwd()}")

absolute_test_dir = os.path.abspath(test_dir)
print(f"Absolute path of the test directory: {absolute_test_dir}")

if not os.path.isdir(test_dir):
    print(f"Error: The directory '{test_dir}' does not exist.")
    exit(1)

print(f"Contents of the directory '{test_dir}': {os.listdir(test_dir)}")

log_file = 'log.html'
report_file = 'report.html'

report_title = 'STORRE APP REPORT TEST'

test_files = [os.path.join(test_dir, f) for f in os.listdir(test_dir) if f.endswith('.robot')]

if not test_files:
    print(f"No .robot test files found in the directory '{test_dir}'.")
    exit(1)

run(*test_files, log=log_file, report=report_file, reporttitle=report_title)
print(f"Tests executed. Log file: {log_file}, Report file: {report_file}")
