# '#' is used for comments
clear	    								  	# clear screen
score=0										  	# initialize score to 0
qno=1;

while IFS='#' read -r question choices answer 	# uses "#" as a separator to separate in the format - question,options,answer.
do											  	# loop to keep asking qns
    echo										# prints a blank line
    echo " ---------------------------------------------- "
    echo
    font="\033#6"								# font type for wider text 
	printf "$font  WELCOME TO THE QUIZ ! "
    echo 
    echo
    echo " ---------------------------------------------- "
    echo
    echo "There are a total of 15 questions in this quiz"
    echo " from various categories."
    echo					
    echo "	------------------------	 "
    echo
    echo "Q"$qno"." $question  					# prints qn on the screen
	qno=`expr $qno + 1`
	echo
    echo "-> "$choices							# prints choices for the qn
	echo
	echo "Your Answer: " 
	read student_answer </dev/tty			  	# input the user's ans from terminal 
	if [ "$student_answer" = "$answer" ]; then
		score=`expr $score + 1`				  	# increment score for every correct ans
	fi										  	# end of if
	clear
done <quiz_dataset.txt							# text file having the dataset for the quiz 

echo    
echo "Your Score is: $score"   
echo "Your Score Percentage is: " $(echo "scale=2 ; ($score/15*100)" | bc)	# calculate percentage from score
echo