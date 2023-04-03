#!/bin/bash

echo "Welcome To Employee Wage Computation Program"


# constant variables
is_present_full_time=1
is_present_part_time=2
full_day_hour=8
part_time_hour=4
wage_per_hour=20
total_working_days=20
max_working_hours=100

# initializing the variables
salary=0
daily_hour=0
total_working_hour=0
day=1

declare -a daily_wage

function random_func ()
{
   # Variable for checking the attendence
    random_chk=$((RANDOM%3)) #0/1/2 
    echo $random_chk
}

function get_working_hours ()
{
    local attendence_chk=$1
    case $attendence_chk in 

    $is_present_full_time) daily_hour=8
                        ;;
    $is_present_part_time) daily_hour=4
                        ;;
    0) daily_hour=0 
    ;;
    esac
    echo $daily_hour
}

while (( $day <= $total_working_days && $total_working_hour <= $max_working_hours))
do
    attendence_chk=$(random_func)
    daily_hour=$(get_working_hours $attendence_chk)
    total_working_hour=$(($total_working_hour + $daily_hour))
    daily_wage[$day]=$(($daily_hour * $wage_per_hour)) 
    ((day++))
  
done

monthly_salary=$(($total_working_hour * $wage_per_hour))
echo "The Monthly Salary of an Employee is $monthly_salary"
echo "The Daily Salary of an Employee is ${daily_wage[@]}"
