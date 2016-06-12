#!/bin/sh

gradetask()
{
    tail -qn1 $@ | awk '{ print $7 }' | cut -f1 -d/
}

gradesection()
{
    section=$1
    path=$2
    grade=2

    for task in $path/*.$section
    do
        grade=$(echo $grade + $(gradetask $task) | bc)
    done

    echo $grade
}

[ $# -eq 0 ] && path=. || path=$1
bash_grade=$(gradesection sh $path)
c_grade=$(gradesection c $path)
echo Total grade for Bash section: $bash_grade
echo Total grade for C section: $c_grade
echo Final grade: $(echo \($bash_grade + $c_grade\) / 2 | bc)
