module Tasks
  def candies(x,y,z,w) 
    if x < 0 or y < 0 or z < 0 or w<=0
      puts "Enter x,y,z>=0 w>0"
    else
      gift = [x,y,z].sort.reverse  # sort the gifts in the array from high to low weight
      result = 0  # the desired result is set to 0
      n1 = w / gift[0]  # possible number of gifts with index 0
      0.upto(n1) do |i|  # cycle from 0 to n1 
        first = (w - i*gift[0])  # the total weight of the residue after placing first gift
        n2 = first / gift[1]  # possible number of gifts with index 1, after placing first gift
        0.upto(n2) do |k|  # cycle from 0 to n2 
          second = (first - k*gift[1])  # the total weight of the residue after placing second gift
          last = second % gift[2]  # determine the remainder when dividing by the third gift
          result += 1 if last == 0  #if the remainder of the division is 0 , the result added 1
        end
      end
      puts result
    end
  end
  
  # candies(10,25,15,40)
  
  
  def jenifer(x,y,n)

   if x<0 or y<0 or n<=0
      puts "Enter x>=0,y>=,n>0"
   elsif x==0 or y==0
      time_copy_one_xerox = x*n +y*n
      puts time_copy_one_xerox
   else
      rus=[x,y].sort  # sorting an array
      k=rus[1].to_f/rus[0] # determine how much slower the second printer
      xerocs_copy2=(n/(k+1)).to_i # the number of photocopies which will make slow Xerox
      xerocs_copy1=(n-xerocs_copy2) # the number of photocopies that will make faster Xerox
      xerox2=xerocs_copy2*rus[1]+rus[0]  # time of slow Xerox
      xerox1=xerocs_copy1*rus[0]  # time of faster Xerox
      time=[xerox1,xerox2].sort  # sort values in the array
      result_time=time[1]  # take the highest value
      puts result_time #full time to copy
   end
 end     

  #jenifer(1,0,11)
  #jenifer(1,1,11)


  def count_friends(matrix,n,s)
    queue = [s]  #an array of person number
    used = []
    friends = []
    1.upto(n) { used.push false } #fill an array which will be responsible for the person we have already considered or not. "false"-not considered man
    used[s-1] = true  # for the person we are looking for friends is assigned a value "true"
    while !(queue.empty?) do  # if the queue is not empty
      person = queue.shift  # pushes the first man from the queue ("the first came in, first-out"), transferring it to a variable.
      person_row = matrix[person - 1]  # pull out a row of human friends
      1.upto(n) do |new_person|  # We take each person оf row
        if person_row[new_person - 1] == 1  # if the expression is "true", do next
          unless used[new_person - 1]  # Check we take this person or nott . If the value "false", do next
            used[new_person - 1] = true  # assigns a value to a friend - "true"
            queue.push(new_person)  # add to the queue a new friend
          end
        end
      end
    end

    used.each_with_index do |person, index|
      if person                   # if person = true, do next
        friends.push(index + 1)   # count all "true"
      end
    end

    friends.length - 1 # does not consider himself
  end



 #count_friends([[0,0,0,0,0],[0,0,1,0,0],[0,1,0,0,1],[0,0,0,0,1],[0,0,1,1,0]], 5, 2)
 #count_friends([[0,1,0],[1,0,1],[0,1,0]], 3, 1)


end
