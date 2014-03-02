This is a Rails 4 project, which uses a  MySQL database.

The goal of this project is to transfer data from a csv file into Mysql model, using Load Data Infile command
and to compare how fast it runs compare to a rake task command -- rake import.

The result is that Load data infile runs more than a 100 times faster than rake.
Please view Rake Import repo for more information.
